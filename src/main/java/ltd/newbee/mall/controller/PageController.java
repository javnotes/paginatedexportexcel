package ltd.newbee.mall.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.support.ExcelTypeEnum;
import com.alibaba.excel.write.metadata.WriteSheet;
import ltd.newbee.mall.entity.User;
import ltd.newbee.mall.service.UserService;
import ltd.newbee.mall.util.PageQueryUtil;
import ltd.newbee.mall.util.PageResult;
import ltd.newbee.mall.util.Result;
import ltd.newbee.mall.utils.DownExcel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/user")
public class PageController {

    @Autowired
    private UserService userService;

    /**
     * 分页功能测试
     * http://localhost:8080/users/list?page=1&limit=10
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Result list(@RequestParam Map<String, Object> params) {
        Result result = new Result();
        if (StringUtils.isEmpty(params.get("page")) || StringUtils.isEmpty(params.get("limit"))) {
            // 返回错误码
            result.setResultCode(500);
            // 错误信息
            result.setMessage("参数异常！");
            return result;
        }
        // 封装查询参数
        PageQueryUtil queryParamList = new PageQueryUtil(params);
        // 查询并封装分页结果集
        PageResult userPage = userService.getUserPage(queryParamList);
        // 返回成功码
        result.setResultCode(200);
        result.setMessage("查询成功");
        // 返回分页数据
        result.setData(userPage);
        return result;
    }


    @GetMapping("/d")
    public void simpleDown(HttpServletResponse response) throws IOException {
        List<User> list = userService.getUserAll();
        DownExcel.download(response, User.class, list);
    }

    /**
     * 分页下载
     * ttp://localhost:8080/users/list?page=1&limit=10
     *
     * @param response
     */
    @GetMapping("/pd")
    public void pageDown(HttpServletResponse response) throws UnsupportedEncodingException {
        Map<String, Object> params = new HashMap<>();
        params.put("page", "1");
        params.put("limit", "10");
        // 封装查询参数
        PageQueryUtil queryParamList = new PageQueryUtil(params);
        // 查询并封装分页结果集
        PageResult userPage = userService.getUserPage(queryParamList);

        // 写到同一个sheet
        String fileName = "电子通知_" + System.currentTimeMillis() + ".xlsx";
        ExcelWriter excelWriter = null;
        try {

            // 这里 需要指定写用哪个class去写
            excelWriter = EasyExcel.write(fileName, User.class).build();
            // 这里注意 如果同一个sheet只要创建一次
            WriteSheet writeSheet = EasyExcel.writerSheet("模板").build();
            // 去调用写入,这里我调用了五次，实际使用时根据数据库分页的总的页数来
            for (int i = 0; i < 50000; i++) {
                // 分页去数据库查询数据 这里可以去数据库查询每一页的数据
//                List<User> list = userService.getUserAll();
//                excelWriter.write(list, writeSheet);

                List<User> data = (List<User>) userPage.getList();
                excelWriter.write(data, writeSheet);
            }
        } finally {
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setCharacterEncoding("utf-8");// 设置字符编码
            // 这里URLEncoder.encode可以防止中文乱码
            fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
            response.setHeader("Content-disposition", "attachment;filename*=utf-8''" + fileName + ".xlsx");

            // 千万别忘记finish 会帮忙关闭流
            if (excelWriter != null) {
                excelWriter.finish();
            }
//
//            response.setContentType("application/vnd.ms-excel");// 设置文本内省
//            response.setCharacterEncoding("utf-8");// 设置字符编码
//            response.setHeader("Content-disposition", "attachment;filename=pageDown.xlsx"); // 设置响应头

        }
    }

}
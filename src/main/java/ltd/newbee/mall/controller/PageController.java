package ltd.newbee.mall.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.write.metadata.WriteSheet;
import ltd.newbee.mall.entity.User;
import ltd.newbee.mall.service.UserService;
import ltd.newbee.mall.util.PageQueryUtil;
import ltd.newbee.mall.util.PageResult;
import ltd.newbee.mall.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author chinalife
 */
@Controller
@RequestMapping("/list")
public class PageController {

    @Autowired
    private UserService userService;

    /**
     * 分页功能测试
     * http://localhost:8080/users/list?page=1&limit=10
     */
    @GetMapping("/list")
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

    /**
     * 分页下载
     *
     * @param response
     */
    @GetMapping("/pageDown")
    public void pageDown(HttpServletResponse response) throws IOException {
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
            for (int i = 0; i < 5000; i++) {
                // 分页去数据库查询数据 这里可以去数据库查询每一页的数据
                List<User> data = (List<User>) userPage.getList();
                excelWriter.write(data, writeSheet);
            }
        } finally {
            // 千万别忘记finish 会帮忙关闭流
            if (excelWriter != null) {
                excelWriter.finish();
            }


            response.setContentType("application/vnd.ms-excel");// 设置文本内省
            response.setCharacterEncoding("utf-8");// 设置字符编码
            String filePath = URLDecoder.decode(System.getProperty("user.dir") + "\\" + fileName, "UTF-8");

            // 设置 Content-Disposition
            response.addHeader("Content-Disposition", "attachment;fileName=" + URLDecoder.decode(fileName, "UTF-8"));

            // 读取目标文件，通过 response 将目标文件写到客户端
            // 获取目标文件的绝对路径
            String fullFileName = filePath;
            InputStream in = new FileInputStream(fullFileName);
            OutputStream out = response.getOutputStream();

            // 写文件
            int b;
            while ((b = in.read()) != -1) {
                out.write(b);
            }
            in.close();
            out.close();
        }
    }
}


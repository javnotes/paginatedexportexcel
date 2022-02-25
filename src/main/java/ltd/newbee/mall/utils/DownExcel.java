package ltd.newbee.mall.utils;

import com.alibaba.excel.EasyExcel;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class DownExcel {
    public static void download(HttpServletResponse response, Class t, List list) throws IOException {
        // 设置文本内省
        response.setContentType("application/vnd.ms-excel");
        response.setCharacterEncoding("utf-8");// 设置字符编码

        response.setHeader("Content-disposition", "attachment;filename="
                + java.net.URLEncoder.encode("用户信息列表[文件名]", "UTF-8"));// 设置响应头

        EasyExcel.write(response.getOutputStream(), t).sheet("Sheet1").doWrite(list); //用io流来写入数据
    }
}

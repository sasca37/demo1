package com.example.demo.controller;

import com.example.demo.dto.Criteria;
import com.example.demo.dto.Paging;
import com.example.demo.dto.XpuDto;
import com.example.demo.service.XpuService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

@Controller
@Log4j2
public class XpuController {

    @Autowired
    private XpuService xpuService;

    // 실시간 그래프 화면
    @GetMapping("/graph")
    public String test2(Model model) throws Exception {
        List<XpuDto> list = xpuService.xpuList();
        model.addAttribute("list",list);
        return "graph";
    }
    // 실시간 그래프 ajax URL
    @RequestMapping(value = "/getXpu")
    @ResponseBody
    public List<XpuDto> getXpu() throws Exception {
        List<XpuDto> list = xpuService.xpuList();

        return list;
    }
    @GetMapping("/staticGraph")
    public String test3() {
        return "staticGraph";
    }

    //데이터 화면
    @GetMapping("/data")
    public String data(Criteria cri, Model model) throws Exception {
        // 페이징 전체 글 개수
        int boardListCnt = xpuService.boardListCnt(cri);

        // 페이징 객체
        Paging paging = new Paging();
        paging.setCri(cri);
        log.info(cri);
        paging.setTotalCounting(boardListCnt);

        List<XpuDto> list = xpuService.boardList(cri);
        model.addAttribute("list", list);
        model.addAttribute("paging", paging);
        model.addAttribute("cri", cri);
        model.addAttribute("boardListCnt", boardListCnt);

        log.info("list"+list);
        log.info("cri status : "+cri);
        return "data";
    }

    @ResponseBody
    @GetMapping(value = "/excel")
    public void doDownloadFile(HttpServletResponse response) throws IOException {

        String fileName = "data.xlsx";

        response.setContentType("application/octer-stream");
        response.setHeader("Content-Transfer-Encoding", "binary;");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
        try {
            OutputStream os = response.getOutputStream();
            FileInputStream fis = new FileInputStream("\\home\\ubuntu\\Desktop\\eclipse\\workspace\\com\\" + fileName);

            int count = 0;
            byte[] bytes = new byte[8192];

            while ((count = fis.read(bytes)) != -1 ) {
                os.write(bytes, 0, count);
            }

            fis.close();
            os.close();
        } catch (FileNotFoundException ex) {
            System.out.println("FileNotFoundException");
        }
    }
}

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
    // 막대 그래프 화면
    @GetMapping("/staticGraph")
    public String test3() {
        log.info("@@@@@@@@@@");
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
}

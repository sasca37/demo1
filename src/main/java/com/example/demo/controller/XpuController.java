package com.example.demo.controller;

import com.example.demo.dto.XpuDto;
import com.example.demo.service.XpuService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
@Log4j2
public class XpuController {

    @Autowired
    private XpuService xpuService;

    @GetMapping("/")
    public String test(Model model) throws Exception {
        List<XpuDto> list = xpuService.boardList();
        log.info("aaa"+list);

        model.addAttribute("list",list);
//        log.info(list.);
        return "index";
    }
}

package com.example.demo.controller;

import com.example.demo.dto.XpuDto;
import com.example.demo.service.XpuService;
import com.google.gson.Gson;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
        return "index";
    }

    @ResponseBody
    @GetMapping("/test")
    public List<XpuDto> test2(Model model) throws Exception {
        List<XpuDto> list = xpuService.boardList();
        log.info("aaa"+list);
        model.addAttribute("list",list);
//        log.info(list.); , @RequestParam String list
        return list;
    }

    @GetMapping("/ajax.do")
    @ResponseBody
    public void ajax(HttpServletResponse response, List<XpuDto> list) throws Exception {
        log.info("호출완");
        Gson gson = new Gson();

        Map<String, Object> data = new HashMap<>();

        data.put("rs", list);
        data.put("msg", "json data");
        data.put("name", "ljbjh");

        response.getWriter().print(gson.toJson(data));
    }
}

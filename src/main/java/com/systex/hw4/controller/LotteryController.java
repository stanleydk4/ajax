package com.systex.hw4.controller;

import java.util.List;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.systex.hw4.service.LotteryService;

@Controller
public class LotteryController {
	@Autowired
	private LotteryService lotteryService;
	
	@GetMapping("/main")
	public String lottery() {
		return "/protected/main";
	}
	
	@GetMapping("/lotteryController.do")
	public String generateLotteryNumbers(
			@RequestParam("group") Integer group,
			@RequestParam("excludeNum") String excludeNum,
			Model model) {
		
		if (group == null || group <= 0) {
	        model.addAttribute("error", "請輸入有效的組數（正整數）");
	        return "main";
	    }

        if (excludeNum == null || excludeNum.trim().isEmpty()) {
            model.addAttribute("error", "請輸入欲排除的數字!");
            return "main";
        }

        String[] excludeNumsArray = excludeNum.split(" ");
        TreeSet<Integer> excludeNumSet = new TreeSet<>();

        try {
            for (String num : excludeNumsArray) {
                if (!num.trim().isEmpty()) {
                    excludeNumSet.add(Integer.parseInt(num));
                }
            }
        } catch (NumberFormatException e) {
            model.addAttribute("error", "欲排除的數字須為有效數字!");
            return "main";
        }

        List<List<Integer>> generatedNumbers = lotteryService.getNumbers(group, excludeNumSet);

        model.addAttribute("generatedNumbers", generatedNumbers);

        return "protected/resultLottery";
	}
	
}

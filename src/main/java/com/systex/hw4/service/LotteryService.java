package com.systex.hw4.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.TreeSet;

import org.springframework.stereotype.Service;

@Service
public class LotteryService {
	public List<List<Integer>> getNumbers(int groupNum, Set<Integer> excludeNumbers) {
        List<List<Integer>> result = new ArrayList<>();
        Random random = new Random();
        
        for (int i = 0; i < groupNum; i++) {
            Set<Integer> group = new TreeSet<>();
            while (group.size() < 6) {
                int num = random.nextInt(49) + 1;  
                if (!excludeNumbers.contains(num)) {
                    group.add(num);
                }
            }
            result.add(new ArrayList<>(group));
        }
        
        return result;
	}
}

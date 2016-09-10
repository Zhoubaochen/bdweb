package bdweb.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class IndexController {
	@GetMapping
    public String get() {
        return "index";
    }
	
	@RequestMapping("/showPersona")
	public String findOwner(@RequestParam String userId, Model model) {
	    //Owner owner = ownerService.findOwner(userId);
		if(userId==null||userId.isEmpty()){
			
			return "index";
			
		}
		String[] categories={"衬衫","羊毛衫","雪纺衫","裤子","高跟鞋","袜子"};
		int[] data={5, 20, 36, 10, 10, 20};
		int[] scores={4300, 10000, 28000, 35000, 50000};
		int score=760;
		Map result=new HashMap();
		//result.put("categories", categories);
		//result.put("data", data);
		result.put("scores", scores);
		result.put("score", score);
	    model.addAttribute("result", result);
	    model.addAttribute("userId", userId);
	    return "showPersona";
	}
}

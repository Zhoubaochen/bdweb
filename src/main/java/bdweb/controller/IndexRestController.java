package bdweb.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import bdweb.model.WordCloud;

@RestController
public class IndexRestController {
	
	@RequestMapping(value="/getWordCloud")
    public List<WordCloud> greeting(@RequestParam(value="userId") String userId) {
        List<WordCloud> wordClouds=new ArrayList<WordCloud>();
        WordCloud word1=new WordCloud("乐天派",7);
        WordCloud word2=new WordCloud("城会玩",21);
        WordCloud word3=new WordCloud("技术宅",7);
        WordCloud word4=new WordCloud("IT男",17);
        WordCloud word5=new WordCloud("阿斯顿",7);
        WordCloud word6=new WordCloud("阿桑地方",5);
        WordCloud word7=new WordCloud("委任为",7);
        wordClouds.add(word1);
        wordClouds.add(word2);
        wordClouds.add(word3);
        wordClouds.add(word4);
        wordClouds.add(word5);
        wordClouds.add(word6);
        wordClouds.add(word7);
             
		return wordClouds;
    }
}

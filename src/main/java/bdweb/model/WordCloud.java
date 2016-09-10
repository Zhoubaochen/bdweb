package bdweb.model;

public class WordCloud {
	String text;
	int weight;
	public WordCloud(String text,int weight){
		this.text=text;
		this.weight=weight;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	
	
}

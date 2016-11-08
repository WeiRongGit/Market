package goodlist;
/**
 * 商品类
 * @author Lenovo
 *
 */
public class Goods {
	private String name;// 商品名字
	private int id;// 商品id
	private double price;// 商品价格
	private int buyNum = 0;// 购买数量
	private int save;// 库存
	private String src;
	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public int getSave() {
		return save;
	}

	public void setSave(int save) {
		this.save = save;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getBuyNum() {
		return buyNum;
	}

	public void setBuyNum(int buyNum) {
		this.buyNum = buyNum;
	}
}

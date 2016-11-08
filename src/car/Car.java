/**
 * 定义一个购物车类
 * 实现增删查改
 */

package car;

import goodlist.Goods;

import java.util.ArrayList;

public class Car {
	ArrayList<Goods> car = new ArrayList<Goods>();

	public ArrayList<Goods> getCar() {
		return car;
	}

	public void setCar(ArrayList<Goods> car) {
		this.car = car;
	}

	public void addGood(Goods good, int num) {
		// 检查商品是否存放在购物车 ，如果购物车里存在这商品，数量+num
		boolean have = false;
		for (Goods temp : car) {
			if (temp.getId() == good.getId()) {
				if (temp.getBuyNum() + num > temp.getSave())
					temp.setBuyNum(temp.getSave());
				else
					temp.setBuyNum(temp.getBuyNum() + num);
				have = true;
			}
		}
		// 如果不存在，假如购物车
		if (!have) {
			good.setBuyNum(num);
			car.add(good);
		}
	}

	// 删除某商品
	public void deleteGood(int ID, int num) {
		for (Goods temp : car) {
			if (ID == temp.getId()) {
				temp.setBuyNum(temp.getBuyNum() - num);
				if (temp.getBuyNum() <= 0) {
					car.remove(temp);
				}
			}
		}
	}

	// 购物车总价
	public double getCarSum() {
		double sum = 0;
		for (Goods fg : car) {
			sum += (fg.getPrice() * fg.getBuyNum());
		}
		return sum;
	}

	// 单商品总价
	public double getGoodSum(Goods fg) {

		return fg.getPrice() * fg.getBuyNum();

	}

	// 清楚购物车
	public void clear() {
		car.clear();
	}

	/* 删除一个但没有调用 */
	public void delectOne(int id) {
		for (int i = 0; i < car.size(); i++) {
			Goods fg = car.get(i);
			if (fg.getId() == id) {
				fg.setBuyNum(fg.getBuyNum() - 1);
				if (fg.getBuyNum() <= 0) {
					car.remove(i);
				}
				break;
			}
		}
	}

	public int getSize() {
		return car.size();
	}

	public void change(int ID, int num) {
		for (int i = 0; i < car.size(); i++) {
			Goods good = car.get(i);
			if (good.getId() == ID) {
				good.setBuyNum(num + good.getBuyNum());
				if (good.getBuyNum() <= 0) {
					car.remove(good);
				}
			}
		}
	}

	public Goods findById(int ID) {
		for (Goods good : car) {
			if (ID == good.getId()) {
				return good;

			}
		}

		return null;

	}
}

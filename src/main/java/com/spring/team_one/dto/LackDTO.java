package com.spring.team_one.dto;

public class LackDTO {

		// LACK 테이블
		private int lack_code; // 랙코드
		private String location; // 랙위치
		private int la_qty; // 수량
		private int product_id; // 상품코드
		private int wh_id; // 창고 코드


		public int getLack_code() {
			return lack_code;
		}
		public void setLack_code(int lack_code) {
			this.lack_code = lack_code;
		}
		public String getLocation() {
			return location;
		}
		public void setLocation(String location) {
			this.location = location;
		}
		public int getLa_qty() {
			return la_qty;
		}
		public void setLa_qty(int la_qty) {
			this.la_qty = la_qty;
		}
		public int getProduct_id() {
			return product_id;
		}
		public void setProduct_id(int product_id) {
			this.product_id = product_id;
		}
		public int getWh_id() {
			return wh_id;
		}
		public void setWh_id(int wh_id) {
			this.wh_id = wh_id;
		}
		@Override
		public String toString() {
			return "LackDTO [lack_code=" + lack_code + ", location=" + location + ", la_qty=" + la_qty + ", product_id="
					+ product_id + ", wh_id=" + wh_id + "]";
		}

}

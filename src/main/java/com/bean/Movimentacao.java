package com.bean;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Movimentacao {

	int mov_id;
	int cont_id;
	String mov_tipo;
	String mov_dtInicial;
	String mov_dtFinal;
	String cont_num;

	public int getMov_id() {
		return mov_id;
	}

	public void setMov_id(int mov_id) {
		this.mov_id = mov_id;
	}

	public int getCont_id() {
		return cont_id;
	}

	public void setCont_id(int cont_id) {
		this.cont_id = cont_id;
	}

	public String getMov_tipo() {
		return mov_tipo;
	}

	public void setMov_tipo(String mov_tipo) {
		this.mov_tipo = mov_tipo;
	}

	public String getMov_dtInicial() {
		return mov_dtInicial;
	}

	public String getMov_dtInicial(Boolean convert) throws ParseException {

		Date dt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(mov_dtInicial);

		SimpleDateFormat dtString = new SimpleDateFormat("dd/MM/yyyy hh:mm a");

		return dtString.format(dt);

	}

	public void setMov_dtInicial(String mov_dtInicial) {
		this.mov_dtInicial = mov_dtInicial;
	}

	public String getMov_dtFinal() {
		return mov_dtFinal;
	}

	public String getMov_dtFinal(Boolean convert) throws ParseException {

		Date dt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(mov_dtFinal);

		SimpleDateFormat dtString = new SimpleDateFormat("dd/MM/yyyy hh:mm a");

		return dtString.format(dt);

	}

	public void setMov_dtFinal(String mov_dtFinal) {
		this.mov_dtFinal = mov_dtFinal;
	}

	public String getCont_num() {
		return cont_num;
	}

	public void setCont_num(String cont_num) {
		this.cont_num = cont_num;
	}

}

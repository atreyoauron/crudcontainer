package com.bean;

public class Relatorio {
	// 1- embarque, 2 - descarga, 3- gate in, 4 - gate out , 5 - reposicioanmento, 6
	// - pesagem, 7 -scanner

	String rel_cliente;

	int rel_totalEmbarque;
	int rel_totalDescarga;
	int rel_totalGateIn;
	int rel_totalGateOut;
	int rel_totalReposicionamento;
	int rel_totalPesagem;
	int rel_totalScanner;

	public String getRel_cliente() {
		return rel_cliente;
	}

	public void setRel_cliente(String rel_cliente) {
		this.rel_cliente = rel_cliente;
	}

	public int getRel_totalEmbarque() {
		return rel_totalEmbarque;
	}

	public void setRel_totalEmbarque(int rel_totalEmbarque) {
		this.rel_totalEmbarque = rel_totalEmbarque;
	}

	public int getRel_totalDescarga() {
		return rel_totalDescarga;
	}

	public void setRel_totalDescarga(int rel_totalDescarga) {
		this.rel_totalDescarga = rel_totalDescarga;
	}

	public int getRel_totalGateIn() {
		return rel_totalGateIn;
	}

	public void setRel_totalGateIn(int rel_totalGateIn) {
		this.rel_totalGateIn = rel_totalGateIn;
	}

	public int getRel_totalGateOut() {
		return rel_totalGateOut;
	}

	public void setRel_totalGateOut(int rel_totalGateOut) {
		this.rel_totalGateOut = rel_totalGateOut;
	}

	public int getRel_totalReposicionamento() {
		return rel_totalReposicionamento;
	}

	public void setRel_totalReposicionamento(int rel_totalReposicionamento) {
		this.rel_totalReposicionamento = rel_totalReposicionamento;
	}

	public int getRel_totalPesagem() {
		return rel_totalPesagem;
	}

	public void setRel_totalPesagem(int rel_totalPesagem) {
		this.rel_totalPesagem = rel_totalPesagem;
	}

	public int getRel_totalScanner() {
		return rel_totalScanner;
	}

	public void setRel_totalScanner(int rel_totalScanner) {
		this.rel_totalScanner = rel_totalScanner;
	}
}

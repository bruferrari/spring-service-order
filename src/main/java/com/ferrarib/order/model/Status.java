package com.ferrarib.order.model;

public enum Status {

	OPENED(0, "ABERTO"), CLOSED(1, "FECHADO"), PENDING(2, "PENDENTE");

	private int id;
	private String description;
	
	Status(int id, String description) {
		this.id = id;
		this.description = description;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}

package com.model;

/**
 * 应聘人员Model类
 */
public class User {
	public User() {
	}

	/**
	 * id
	 */
	private Integer id;
	/**
	 * 用户名
	 */
	private String uname;
	/**
	 * 密码
	 */
	private String upwd;
	/**
	 * 姓名
	 */
	private String name;
	/**
	 * 性别
	 */
	private String sex;
	/**
	 * 联系电话
	 */
	private String tel;
	/**
	 * 邮箱
	 */
	private String email;
	/**
	 * 出生日期
	 */
	private String birthday;
	/**
	 * 照片
	 */
	private String photo;

	
	/**
	 * 删除状态
	 */
	private Integer state;

	/**
	 * 注册类型
	 */
	private Integer type;



	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUname() {
		return this.uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpwd() {
		return this.upwd;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirthday() {
		return this.birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}



	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}
}

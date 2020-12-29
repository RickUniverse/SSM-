package org.ssmsuper.pojo;

import javax.validation.constraints.Email;
import javax.validation.constraints.Pattern;

public class Employee {

    private Integer id;

    @Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})",
            message = "名字必须是2-5个汉字或6-16个的英文字符可以包含 - _ 符号!")
    private String lastName;

    private String gender;

    //@Email
    @Pattern(regexp = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",
            message = "邮箱格式不正确!")
    private String email;

    private Integer deptId;

    private String empState;

    private Integer version;

    private Integer logicFlag;

    private String address;

    private String createtime;

    private Department department;

    public Employee(Integer id, String lastName, String email, Integer deptId) {
        this.id = id;
        this.lastName = lastName;
        this.email = email;
        this.deptId = deptId;
    }

    public Department getDepartment() {
        return department;
    }

    public Employee setDepartment(Department department) {
        this.department = department;
        return this;
    }

    public Employee() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName == null ? null : lastName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }

    public String getEmpState() {
        return empState;
    }

    public void setEmpState(String empState) {
        this.empState = empState == null ? null : empState.trim();
    }

    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    public Integer getLogicFlag() {
        return logicFlag;
    }

    public void setLogicFlag(Integer logicFlag) {
        this.logicFlag = logicFlag;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime == null ? null : createtime.trim();
    }
}
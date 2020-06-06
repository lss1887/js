package com.oppo.domain;

import java.util.List;

/**
 * Created by linshisheng on 2019/07/18.
 */
public class User {
    private Integer id;
    private String name;
    private Integer age;

    private List<Address> adddress;

    public User() {
    }

    public User(Integer id, String name, Integer age) {
        this.id = id;
        this.name = name;
        this.age = age;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User(String name, Integer age) {
        this.name = name;
        this.age = age;
    }

    public User(String name, Integer age, List<Address> adddress) {
        this.name = name;
        this.age = age;
        this.adddress = adddress;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public List<Address> getAdddress() {
        return adddress;
    }

    public void setAdddress(List<Address> adddress) {
        this.adddress = adddress;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", age=" + age +
                ", adddress=" + adddress +
                '}';
    }

}

package org.ssmsuper.pojo;

import java.util.HashMap;
import java.util.Map;

/**
 * @author lijichen
 * @date 2020/12/27 - 15:16
 */
public class Msg {
    // 100 表示成功, 200 表示失败
    private int code;

    //描述信息
    private  String msg;

    private Map<String, Object> dataMap = new HashMap<>();

    //成功的对象
    public static Msg success() {
        return new Msg()
                .setCode(100)
                .setMsg("成功!");
    }
    //失败的对象
    public static Msg fail() {
        return new Msg()
                .setCode(200)
                .setMsg("失败!");
    }

    // 添加数据信息
    public Msg addData(String name, Object data) {
        if (name != null) {
            dataMap.put(name,data);
        }
        return this;
    }


    public int getCode() {
        return code;
    }

    public Msg setCode(int code) {
        this.code = code;
        return this;
    }

    public String getMsg() {
        return msg;
    }

    public Msg setMsg(String msg) {
        this.msg = msg;
        return this;
    }

    public Map<String, Object> getDataMap() {
        return dataMap;
    }

    public Msg setDataMap(Map<String, Object> dataMap) {
        this.dataMap = dataMap;
        return this;
    }
}

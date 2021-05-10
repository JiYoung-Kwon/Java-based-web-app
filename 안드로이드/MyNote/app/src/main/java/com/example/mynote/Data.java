package com.example.mynote;

import java.util.Date;

public class Data {
    int _id;
    Date nal;
    String subject;
    String doc;

    public Data(){}

    public Data(int _id, Date n, String s, String d){
        this._id = _id;
        this.nal = n;
        this.subject = s;
        this.doc = d;
    }

    public int get_id() {
        return _id;
    }

    public void set_id(int _id) {
        this._id = _id;
    }

    public Date getNal() {
        return nal;
    }

    public void setNal(Date nal) {
        this.nal = nal;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getDoc() {
        return doc;
    }

    public void setDoc(String doc) {
        this.doc = doc;
    }
}
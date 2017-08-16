package com.smith.model;

//use if you're returning a plain String as JSON
public class StringResponse {

    private String response;

    public StringResponse(String s) { 
       this.response = s;
    }
}
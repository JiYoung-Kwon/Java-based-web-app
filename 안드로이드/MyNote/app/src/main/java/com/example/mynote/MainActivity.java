package com.example.mynote;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.database.sqlite.SQLiteDatabase;
import android.os.Bundle;
import android.view.View;

public class MainActivity extends AppCompatActivity {
    DatabaseHelper dbHelper;
    SQLiteDatabase db;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        dbHelper = new DatabaseHelper(this);
        db = dbHelper.getReadableDatabase();
    }

    public void onSearch(View v){
        Intent intent = new Intent(this,SearchActivity.class);
        startActivity(intent);
    }

    public void onRegister(View v){
        Intent intent = new Intent(this,RegisterActivity.class);
        startActivity(intent);
    }
}
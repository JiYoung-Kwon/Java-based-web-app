package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void onButtonClicked(View v){
        Toast.makeText(this,"하이~~~~", Toast.LENGTH_LONG).show();
    }

    public void onNaverClicked(View v){
        Intent myIntent = new Intent(Intent.ACTION_VIEW, Uri.parse("http://m.naver.com"));
        startActivity(myIntent);
    }

    public void onCallClicked(View v){
        Intent myIntent = new Intent(Intent.ACTION_VIEW, Uri.parse("tel:010-1000-1000"));
        startActivity(myIntent);
    }

    public void onMoveActivity(View v){
        Intent myIntent = new Intent(this, MyLinearLayout.class);
        startActivity(myIntent);
    }

    public void onJavaCode(View v){
        Intent myIntent = new Intent(this,LayoutCodeActivity.class);
        startActivity(myIntent);
    }

    public void onGravy(View v){
        Intent intent = new Intent(this, GravyActivity.class);
        startActivity(intent);
    }

    public void onRelative(View v){
        Intent intent = new Intent(this, RelativeActivity.class);
        startActivity(intent);
    }

    public void onTable(View v){
        Intent intent = new Intent(this,TableLayoutActivity.class);
        startActivity(intent);
    }

    public void onFrame(View v){
        Intent intent = new Intent(this,FrameLayoutActivity.class);
        startActivity(intent);
    }

    public void onScroll(View v){
        Intent intent = new Intent(this,ScrollViewActivity.class);
        startActivity(intent);
    }
}
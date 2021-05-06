package com.example.myapplication;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.ImageView;

public class FrameLayoutActivity extends AppCompatActivity {
    int imageIndex = 0;

    ImageView[] imageView;
    int[] ids = {
            R.id.imageView3, R.id.imageView4, R.id.imageView5
    };

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_frame_layout);
        imageView = new ImageView[ids.length];

        for(int i=0; i<ids.length; i++){
            imageView[i] = findViewById(ids[i]);
            imageView[i].setVisibility(View.INVISIBLE);
        }
        imageView[imageIndex].setVisibility(View.VISIBLE);
    }

    public void onChangeImage(View v){
        changeImage();
    }

    private void changeImage(){
        imageView[imageIndex].setVisibility(View.INVISIBLE);
        imageIndex++;
        imageIndex = imageIndex%ids.length;
        imageView[imageIndex].setVisibility(View.VISIBLE);

    }
}
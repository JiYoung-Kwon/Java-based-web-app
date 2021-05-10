package com.example.mynote;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.Toast;

public class ViewActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_view);

        String _id = getIntent().getExtras().getString("_id");
        Toast.makeText(getApplicationContext(), "전달받은 ID:" + _id, Toast.LENGTH_SHORT).show();
    }
}
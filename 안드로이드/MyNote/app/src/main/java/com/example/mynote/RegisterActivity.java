package com.example.mynote;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

public class RegisterActivity extends AppCompatActivity {
    DatabaseHelper helper;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_register);

        helper = new DatabaseHelper(this);
    }

    public void onRegister(View v){
        EditText etSubject = findViewById(R.id.etSubject);
        EditText etDoc = findViewById(R.id.etDoc);

        Data data = new Data();
        data.setSubject(etSubject.getText().toString());
        data.setDoc(etDoc.getText().toString());

        String msg = helper.register(data);
        Toast.makeText(this, msg, Toast.LENGTH_LONG).show();
    }
}
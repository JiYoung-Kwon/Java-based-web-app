package com.example.mynote;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.SimpleAdapter;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SearchActivity extends AppCompatActivity {
    DatabaseHelper helper;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    ListView listView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_search);
        helper = new DatabaseHelper(this);
    }

    // etFindStr의 값을 갖고 helper.search(String)을 호출하여 그 결과값을 List<Data>로 반환받은 뒤
    // 반환받은 결과값을 listView에 표시
    public void onSearch(View v){
        listView = findViewById(R.id.listView);
        EditText etFindStr = findViewById(R.id.etFindStr);
        String findStr =  etFindStr.getText().toString();

        List<Data> list = helper.search(findStr);
        List<Map<String, String>> listMap = new ArrayList<Map<String, String>>();

        for(Data d:list){
            // Log.d("data.........", d.getSubject());
            Map<String, String> map = new HashMap<String, String>();
            map.put("_id", d.get_id() + "");
            map.put("nal", sdf.format(d.getNal()));
            map.put("subject", d.getSubject());
            listMap.add(map);
        }

        SimpleAdapter adapter = new SimpleAdapter(
                getApplicationContext(),
                listMap,
                android.R.layout.simple_list_item_2,
                new String[]{ "subject","nal"},
                new int[]{ android.R.id.text1, android.R.id.text2}
        );

        listView.setAdapter(adapter);

        // item을 클릭하면
        listView.setOnItemClickListener(new AdapterView.OnItemClickListener(){
            public void onItemClick(AdapterView<?> parent, View view, int position, long id) {
                Map<String, String> map = listMap.get(position);
                String temp = "_ID : " + map.get("_id")
                        + ", subject : " + map.get("subject")
                        + ", nal : " + map.get("nal");
                //Toast.makeText(getApplicationContext(), temp, Toast.LENGTH_LONG).show();

                Intent intent = new Intent(getApplicationContext(), ViewActivity.class);
                intent.putExtra("_id", map.get("_id"));
                startActivity(intent);
            }
        });

    }
}
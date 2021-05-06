package com.example.mynote;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

public class DatabaseHelper extends SQLiteOpenHelper {
    public static String NAME = "note.db";
    public static int VERISION = 1;

    public DatabaseHelper(Context context){
        super(context, NAME, null, VERISION);
    }

    @Override
    public void onCreate(SQLiteDatabase db) {
        String sql = "create table if not exists note("
                   + "_id integer PRIMARY KEY autoincrement, "
                   + "nal date, "
                   + "subject text, "
                   + "doc text)";
        db.execSQL(sql);
    }

    @Override
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        Log.d("upgrade","App이 업그레이드 됨.......");
    }

    public void onOpen(SQLiteDatabase db){
        Log.d("db open", "note.db가 open 되었습니다.");
    }


}

package com.example.mynote;

import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.util.Log;

import java.text.SimpleDateFormat;
import java.util.List;

public class DatabaseHelper extends SQLiteOpenHelper {
    public static String NAME = "note.db";
    public static int VERISION = 1;
    SQLiteDatabase db;

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

    public String register(Data data){
        String msg = "정상적으로 저장되었습니다.";
        db = this.getWritableDatabase();
        String sql = "insert into note(nal, subject, doc) values(date('now'), ?, ?)";
        String[] params = {data.getSubject(), data.getDoc()};
        try{
            db.beginTransaction();
            db.execSQL(sql, params);
            db.setTransactionSuccessful();
        }catch(Exception ex){
            msg = ex.toString();
        }
        db.endTransaction();
        db.close();
        return msg;
    }

    public List<Data> search(String findStr){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        List<Data> list = null;
        db = this.getReadableDatabase();
        String sql = "select * from note where subject like ? or doc like ? ";
        String[] params = {"%" + findStr + "%", "%" + findStr + "%"};
        try{
            Cursor c = db.rawQuery(sql, params);
            while(c.moveToNext()){
                Data data = new Data();
                data.set_id(c.getInt(0));
                data.setNal(sdf.parse(c.getString(1)));
                data.setSubject(c.getString(2));
                data.setDoc(c.getString(3));

                list.add(data);
            }
        }catch(Exception ex){
            list = null;
        }
        db.close();
        return list;
    }
}

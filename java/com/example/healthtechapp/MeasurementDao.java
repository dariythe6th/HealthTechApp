package com.example.healthtechapp;

import androidx.room.Dao;
import androidx.room.Insert;
import androidx.room.Query;

import java.util.List;

@Dao
public interface MeasurementDao {
    @Insert
    void insert(MeasurementEntity m);
    @Query("SELECT * FROM MeasurementEntity ORDER BY timestamp DESC")
    List<MeasurementEntity> getAll();
}

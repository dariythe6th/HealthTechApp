package com.example.healthtechapp;

import androidx.room.Entity;
import androidx.room.PrimaryKey;

@Entity
public class MeasurementEntity {
    @PrimaryKey(autoGenerate = true)
    public int id;
    public int heartRate;
    public float activityLevel;
    public long timestamp;
}

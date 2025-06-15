package com.example.healthtechapp;

import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.room.Room;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import java.util.List;

public class HistoryFragment extends Fragment {
    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_history, container, false);
        TextView historyText = view.findViewById(R.id.historyText);

        AppDatabase db = Room.databaseBuilder(getContext(), AppDatabase.class, "health-db").allowMainThreadQueries().build();
        List<MeasurementEntity> list = db.measurementDao().getAll();
        StringBuilder sb = new StringBuilder();

        for (MeasurementEntity m : list) {
            sb.append("Пульс: ").append(m.heartRate).append(", Активность: ").append(m.activityLevel).append("\n");
        }

        historyText.setText(sb.toString());
        return view;
    }
}

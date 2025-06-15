package com.example.healthtechapp;

import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;
import androidx.room.Room;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import java.util.Random;

public class DashboardFragment extends Fragment {

    EditText ageField, weightField, heightField;
    TextView heartRateText, activityText;
    Button analyzeBtn;

    int heartRate = 70;
    float activityLevel = 0f;

    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_dashboard, container, false);

        ageField = view.findViewById(R.id.ageField);
        weightField = view.findViewById(R.id.weightField);
        heightField = view.findViewById(R.id.heightField);
        heartRateText = view.findViewById(R.id.heartRateText);
        activityText = view.findViewById(R.id.activityText);
        analyzeBtn = view.findViewById(R.id.btnAnalyze);

        simulateSensors();

        analyzeBtn.setOnClickListener(v -> {
            int age = Integer.parseInt(ageField.getText().toString());
            float weight = Float.parseFloat(weightField.getText().toString());
            float height = Float.parseFloat(heightField.getText().toString());

            MeasurementEntity m = new MeasurementEntity();
            m.heartRate = heartRate;
            m.activityLevel = activityLevel;
            m.timestamp = System.currentTimeMillis();

            AppDatabase db = Room.databaseBuilder(getContext(), AppDatabase.class, "health-db").allowMainThreadQueries().build();
            db.measurementDao().insert(m);

            float score = m.heartRate / 100f + m.activityLevel + (age > 50 ? 1.0f : 0.5f);
            String risk = score > 2 ? "Высокий риск" : "Низкий риск";

            Bundle result = new Bundle();
            result.putString("risk", risk);

            ResultFragment resultFragment = new ResultFragment();
            resultFragment.setArguments(result);
            requireActivity().getSupportFragmentManager().beginTransaction()
                    .replace(R.id.container, resultFragment)
                    .addToBackStack(null)
                    .commit();
        });

        return view;
    }

    void simulateSensors() {
        heartRate = 70 + new Random().nextInt(10);
        heartRateText.setText("Пульс: " + heartRate);

        activityLevel = 1.0f + new Random().nextFloat();
        activityText.setText("Активность: " + activityLevel);
    }
}

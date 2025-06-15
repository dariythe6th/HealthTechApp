package com.example.healthtechapp;

import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

public class ResultFragment extends Fragment {
    public View onCreateView(@NonNull LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        View view = inflater.inflate(R.layout.fragment_result, container, false);
        TextView resultText = view.findViewById(R.id.resultText);
        String risk = getArguments().getString("risk", "Нет данных");
        resultText.setText("Результат анализа: " + risk + "\n\n⚠ Это не диагноз. Обратитесь к врачу.");
        return view;
    }
}

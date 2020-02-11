package com.chessluo.flutter_study_app;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Bundle;
import io.flutter.app.FlutterActivity;

import io.flutter.plugin.common.EventChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;
import io.flutter.plugin.common.PluginRegistry;

import io.flutter.plugin.common.EventChannel.EventSink;



import io.flutter.plugin.common.EventChannel.EventSink;
/**
 * @描述 Flutter android主页
 * @author chessluo
 * @email superluo666@gmail.com
 * @date 2019-08-11
 *
 */

public class MainActivity extends FlutterActivity {

  private static final String CHARGING_CHANNEL = "samples.flutter.io/charging";

  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    GeneratedPluginRegistrant.registerWith(this);

    registerCustomPlugin(this);
    registerChargingPlugin(this);

  }

  private void registerCustomPlugin(PluginRegistry registrar) {
    MyMethodChannel.registerWith(registrar.registrarFor(MyMethodChannel.CHANNEL));
  }

  private void registerChargingPlugin(PluginRegistry registrar) {
        new EventChannel(registrar.registrarFor(CHARGING_CHANNEL).messenger(), CHARGING_CHANNEL).setStreamHandler(
                new EventChannel.StreamHandler() {
                    private BroadcastReceiver chargingStateChangeReceiver;
                    @Override
                    public void onListen(Object arguments, EventSink events) {
                        chargingStateChangeReceiver = createChargingStateChangeReceiver(events);
                        registerReceiver(
                                chargingStateChangeReceiver, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
                    }

                    @Override
                    public void onCancel(Object arguments) {
                        unregisterReceiver(chargingStateChangeReceiver);
                        chargingStateChangeReceiver = null;
                    }
                }
        );

    }


  private BroadcastReceiver createChargingStateChangeReceiver(final EventSink events) {
    return new BroadcastReceiver() {
      @Override
      public void onReceive(Context context, Intent intent) {
        int status = intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1);

        if (status == BatteryManager.BATTERY_STATUS_UNKNOWN) {
          events.error("UNAVAILABLE", "Charging status unavailable", null);
        } else {
          boolean isCharging = status == BatteryManager.BATTERY_STATUS_CHARGING ||
                  status == BatteryManager.BATTERY_STATUS_FULL;
          events.success(isCharging ? "charging" : "discharging");
        }
      }
    };
  }


}

package io.github.ponnamkarthik.toast.fluttertoast

import android.content.Context
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel

/** FlutterToastPlugin */
public class FlutterToastPlugin: FlutterPlugin {

  private var channel: MethodChannel? = null

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding,) {
    setupChannel(binding.binaryMessenger, binding.applicationContext, binding.flutterAssets,)
  }

  override fun onDetachedFromEngine(p0: FlutterPlugin.FlutterPluginBinding,) {
    teardownChannel();
  }

  private fun setupChannel(
    messenger: BinaryMessenger,
    context: Context,
    flutterAssets: FlutterPlugin.FlutterAssets,
  ) {
    channel = MethodChannel(messenger, "PonnamKarthik/fluttertoast",)
    val handler = MethodCallHandlerImpl(context, flutterAssets,)
    channel?.setMethodCallHandler(handler,)
  }

  private fun teardownChannel() {
    channel?.setMethodCallHandler(null,)
    channel = null
  }

}

# Copyright 2020 The MediaPipe Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

load(
    "@build_bazel_rules_apple//apple:ios.bzl",
    "ios_framework",
)

ios_framework(
    name = "PoseTrackingGpuApp",

    hdrs = [
        "FullBodyPoseTracker.h",
    ],
    
    infoplists = ["Info.plist"],
    bundle_id = "uplift.noppe.HandTracker",
    families = ["iphone", "ipad"],
    minimum_os_version = "13.0",
    deps = [
        ":CommonAppLibrary",
        "@ios_opencv//:OpencvFramework",
    ],
)

objc_library(
    name = "CommonAppLibrary",
    srcs = [
        "FullBodyPoseTracker.mm",
    ],
    hdrs = [
        "FullBodyPoseTracker.h",
    ],
    
    sdk_frameworks = [
        "AVFoundation",
        "CoreGraphics",
        "CoreMedia",
        "UIKit",
    ],
    
    copts = ["-std=c++17"],
    
    data = [ 
        "//mediapipe/graphs/pose_tracking:pose_tracking_gpu.binarypb",
        "//mediapipe/modules/pose_detection:pose_detection.tflite",
        "//mediapipe/modules/pose_landmark:pose_landmark_full.tflite",
    ],
    
    deps = [
       # "//mediapipe/examples/ios/common:CommonMediaPipeAppLibrary",
            "//mediapipe/objc:mediapipe_framework_ios",
        "//mediapipe/objc:mediapipe_input_sources_ios",
        "//mediapipe/objc:mediapipe_layer_renderer",
    ] + select({
  #      "//mediapipe:ios_i386": [],
  #      "//mediapipe:ios_x86_64": [],
        "//conditions:default": [
            "//mediapipe/graphs/pose_tracking:pose_tracking_gpu_deps",
            "//mediapipe/framework/formats:landmark_cc_proto",
        ],
    }),
)

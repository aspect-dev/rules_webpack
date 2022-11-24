"""Declare runtime dependencies

These are needed for local dev, and users must install them as well.
See https://docs.bazel.build/versions/main/skylark/deploying.html#dependencies
"""

load("//webpack/private:maybe.bzl", http_archive = "maybe_http_archive")

# WARNING: any changes in this function may be BREAKING CHANGES for users
# because we'll fetch a dependency which may be different from one that
# they were previously fetching later in their WORKSPACE setup, and now
# ours took precedence. Such breakages are challenging for users, so any
# changes in this function should be marked as BREAKING in the commit message
# and released only in semver majors.
def rules_webpack_dependencies():
    # The minimal version of bazel_skylib we require
    http_archive(
        name = "bazel_skylib",
        sha256 = "74d544d96f4a5bb630d465ca8bbcfe231e3594e5aae57e1edbf17a6eb3ca2506",
        urls = ["https://github.com/bazelbuild/bazel-skylib/releases/download/1.3.0/bazel-skylib-1.3.0.tar.gz"],
    )

    http_archive(
        name = "aspect_rules_js",
        sha256 = "f58d7be1bb0e4b7edb7a0085f969900345f5914e4e647b4f0d2650d5252aa87d",
        strip_prefix = "rules_js-1.8.0",
        url = "https://github.com/aspect-build/rules_js/archive/refs/tags/v1.8.0.tar.gz",
    )

    http_archive(
        name = "aspect_bazel_lib",
        sha256 = "695d319362b227725e4daa60d863b4d1969b167889902511f1fd3051cea1071f",
        strip_prefix = "bazel-lib-1.16.3",
        url = "https://github.com/aspect-build/bazel-lib/archive/refs/tags/v1.16.3.tar.gz",
    )

    http_archive(
        name = "rules_nodejs",
        sha256 = "50adf0b0ff6fc77d6909a790df02eefbbb3bc2b154ece3406361dda49607a7bd",
        urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/5.7.1/rules_nodejs-core-5.7.1.tar.gz"],
    )

"""Provides the repository macro to import TFRT."""

load("//third_party:repo.bzl", "tf_http_archive", "tf_mirror_urls")

def repo():
    """Imports TFRT."""

    # Attention: tools parse and update these lines.
    TFRT_COMMIT = "5266f243feb708bdc7e6ca275648a1bca79ce70f"
    TFRT_SHA256 = "1ef4dc0043c661d14e001a917553a93c55f4922b633009c934befd2ea68249ee"

    tf_http_archive(
        name = "tf_runtime",
        sha256 = TFRT_SHA256,
        strip_prefix = "runtime-{commit}".format(commit = TFRT_COMMIT),
        urls = tf_mirror_urls("https://github.com/tensorflow/runtime/archive/{commit}.tar.gz".format(commit = TFRT_COMMIT)),
        # A patch file can be provided for atomic commits to both TF and TFRT.
        # The job that bumps the TFRT_COMMIT also resets patch_file to 'None'.
        patch_file = None,
    )

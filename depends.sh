set -e

RUNTIME="/opt/runtime"
LIBDIR="$RUNTIME/lib"

echo "==> Prepare lib directory"
mkdir -p "$LIBDIR"

copy_lib() {
  for lib in "$@"; do
    if ls /lib/x86_64-linux-gnu/${lib}* >/dev/null 2>&1; then
      cp -av /lib/x86_64-linux-gnu/${lib}* "$LIBDIR/"
    fi
  done
}

echo "==> Copy core crypto / compression"
copy_lib \
  libssl.so \
  libcrypto.so \
  libcrypt.so \
  libz.so \
  libzstd.so \
  liblzma.so

echo "==> Copy XML / charset / regex"
copy_lib \
  libxml2.so \
  libexpat.so \
  libonig.so \
  libpcre2-8.so

echo "==> Copy CURL + network stack"
copy_lib \
  libcurl.so \
  libnghttp2.so \
  libidn2.so \
  libssh2.so \
  librtmp.so \
  libpsl.so

echo "==> Copy LDAP / SASL / Kerberos (needed by curl + php)"
copy_lib \
  libldap-2.5.so \
  liblber-2.5.so \
  libsasl2.so \
  libgssapi_krb5.so \
  libkrb5.so \
  libkrb5support.so \
  libk5crypto.so \
  libkeyutils.so

echo "==> Copy TLS stack deps"
copy_lib \
  libgnutls.so \
  libnettle.so \
  libhogweed.so \
  libgmp.so \
  libunistring.so \
  libp11-kit.so \
  libtasn1.so

echo "==> Copy ICU (intl)"
copy_lib \
  libicudata.so \
  libicui18n.so \
  libicuio.so \
  libicuuc.so

echo "==> Copy image libs"
copy_lib \
  libjpeg.so \
  libpng16.so

echo "==> Copy database libs"
copy_lib \
  libsqlite3.so

echo "==> Copy APR / Apache libs"
copy_lib \
  libapr-1.so \
  libaprutil-1.so

echo "==> Copy misc runtime libs"
copy_lib \
  libffi.so

echo "==> Strip symbols (reduce size)"
strip --strip-unneeded "$LIBDIR"/*.so* 2>/dev/null || true

echo "==> Set RPATH on main binaries"
patchelf --set-rpath '$ORIGIN/../lib' "$RUNTIME/php/bin/php"
patchelf --set-rpath '$ORIGIN/../lib' "$RUNTIME/apache/bin/httpd"
patchelf --set-rpath '$ORIGIN/../lib' "$RUNTIME/apache/modules/libphp.so"

echo "==> Verify unresolved deps"
ldd "$RUNTIME/php/bin/php" | grep "not found" || true
ldd "$RUNTIME/apache/bin/httpd" | grep "not found" || true
ldd "$RUNTIME/apache/modules/libphp.so" | grep "not found" || true

echo "==> Bundle libs complete"

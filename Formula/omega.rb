class Omega < Formula
  desc "Packaged search engine for websites, built on top of Xapian"
  homepage "https://xapian.org/"
  url "https://oligarchy.co.uk/xapian/1.4.23/xapian-omega-1.4.23.tar.xz"
  sha256 "7ba460eba70004d1f44299de4e62dcc84009927e6d52604ae67a3e30165e220f"
  license "GPL-2.0-or-later"

  livecheck do
    url "https://xapian.org/download"
    regex(/href=.*?xapian-omega[._-]v?(\d+(?:\.\d+)+)\.t/i)
  end

  bottle do
    sha256 arm64_ventura:  "516d26bba52083f74e23411b2c759461fee0ef5549cb39a0ef867025d6df3c1c"
    sha256 arm64_monterey: "9cba7602d734dbf4aa3fc00297ededb9c184f760eb1087d39352b1974a934ca7"
    sha256 arm64_big_sur:  "7183270a464cd47c69278fb331f9f4824655fa51914c5c7a53ad8f194a546b9d"
    sha256 ventura:        "04924bc02b36da9fd1999695973c19c0270b42e652ec7e98c61307374ba485cd"
    sha256 monterey:       "25c210fe14c4b2ebb73c1ef71246c546f7d60556c0e853ab6d7a7507d162a29f"
    sha256 big_sur:        "9e4bbce8b2b4c06d8da4dca18a228c510ad15f0bfaaaf75b72147a748096d709"
    sha256 x86_64_linux:   "2b53955fc46a2cb0a811a32553a6a32c372cc63506f152bd880b072c7aaa2298"
  end

  depends_on "pkg-config" => :build
  depends_on "libmagic"
  depends_on "pcre2"
  depends_on "xapian"

  def install
    system "./configure", *std_configure_args, "--disable-silent-rules"
    system "make", "install"
  end

  test do
    system bin/"omindex", "--db", "./test", "--url", "/", share/"doc/xapian-omega"
    assert_predicate testpath/"./test/flintlock", :exist?
  end
end

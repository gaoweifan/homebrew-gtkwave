class Gtkwave < Formula
  desc "GTKWave"
  homepage "https://gtkwave.sourceforge.net"
  license "GPL-2.0-or-later"
  url "https://gtkwave.sourceforge.net/gtkwave-gtk3-3.3.121.tar.gz"
  sha256 "54aa45788d6d52afb659c3aef335aafde0ef2c8990a7770f8eaa64e57f227346"

  depends_on "gobject-introspection" => :build
  depends_on "pkg-config" => :build
  depends_on "gtk+3"
  depends_on "xz"
  depends_on "tcl-tk"

  on_macos do
    depends_on "gtk-mac-integration"
    patch :p2 do
      url "https://github.com/yanjiew1/gtkwave/compare/0704899dd44467395d24ee78bb3d819fc10540a6...f3a85609fec4bb10f8009bcdf1a68abec03eb997.patch"
      sha256 "4d4c730777cb4f0a243387b8793e0230ea68d3ac8368c61118bbb984c096117a"
    end
  end

  def install
    system "./configure", "--enable-gtk3",
                          "--with-tcl=#{Formula["tcl-tk"].opt_prefix}/lib",
                          "--with-tk=#{Formula["tcl-tk"].opt_prefix}/lib",
                          *std_configure_args
    system "make", "install"
  end

end

import '../models/informasi.dart';

Informasi buatInformasi(
  int id,
  String judul,
  String kategori,
  String lokasi,
  String deskripsi,
  String gambar,
) {
  return Informasi(
    id: id,
    judul: judul,
    kategori: kategori,
    lokasi: lokasi,
    deskripsi: deskripsi,
    gambar: gambar,
  );
}

final List<Informasi> informasiData = [
  // ==========================================
  // SEJARAH
  // ==========================================
  buatInformasi(
      1,
      'Museum Kambang Putih',
      'Sejarah',
      'Jl. Kartini No.2, Tuban',
      'Museum Kambang Putih adalah museum daerah yang menyimpan berbagai koleksi bersejarah, mulai dari artefak masa Hindu-Buddha, peninggalan masa Islam, hingga benda-benda pusaka dan replika fosil purba (seperti gajah purba dan kerang raksasa). Museum ini sangat cocok untuk wisata edukasi keluarga, terutama bagi pelajar yang ingin mengenal lebih dalam sejarah dan budaya Kabupaten Tuban.',
      'assets/images/museum_kambang_putih.jpg'),
  buatInformasi(
      2,
      'Makam Sunan Bonang',
      'Sejarah',
      'Desa Kutorejo, Tuban',
      'Makam Sunan Bonang (Raden Makhdum Ibrahim) merupakan salah satu situs ziarah paling penting di Tuban. Sunan Bonang adalah salah satu dari Wali Songo yang berperan besar dalam menyebarkan agama Islam di tanah Jawa, khususnya melalui pendekatan seni dan budaya seperti gamelan. Kawasan makam ini sangat ramai dikunjungi peziarah, terutama saat peringatan Haul Sunan Bonang.',
      'assets/images/makam_sunan_bonang.jpg'),
  buatInformasi(
      3,
      'Masjid Agung Tuban',
      'Sejarah',
      'Alun-Alun Kota Tuban',
      'Masjid Agung Tuban merupakan salah satu masjid tertua di Jawa Timur yang berdiri sejak abad ke-15. Arsitektur masjid ini memadukan gaya tradisional Jawa dan pengaruh Islam, dengan tiang-tiang kayu jati kuno yang masih terjaga keasliannya. Masjid ini menjadi pusat kegiatan keagamaan dan saksi bisu penyebaran Islam di wilayah pesisir utara Jawa.',
      'assets/images/masjid_agung_tuban.jpg'),
  buatInformasi(
      4,
      'Klenteng Kwan Sing Bio',
      'Sejarah',
      'Jl. Mangga No.1, Karangsari',
      'Klenteng Kwan Sing Bio adalah salah satu klenteng terbesar di Asia Tenggara yang menjadi ikon toleransi beragama di Tuban. Klenteng ini memiliki patung Kepiting Raksasa di bagian depannya, yang melambangkan sifat pekerja keras dan pantang menyerah. Tempat ini sering dikunjungi wisatawan untuk melihat arsitektur khas Tionghoa yang megah dan berfoto di area replika Kapal Cheng Ho.',
      'assets/images/klenteng_kwan_sing_bio.jpg'),
  buatInformasi(
      5,
      'Monumen Pancasila',
      'Sejarah',
      'Pusat Kota Tuban',
      'Monumen Pancasila Tuban didirikan untuk mengenang peristiwa bersejarah G30S/PKI dan sebagai pengingat akan pentingnya nilai-nilai Pancasila bagi masyarakat. Monumen ini sering dijadikan lokasi upacara peringatan hari besar nasional dan menjadi salah satu penanda kawasan di pusat kota.',
      'assets/images/monumen_pancasila.jpg'),
  buatInformasi(
      6,
      'Monumen Kuda Ronggolawe',
      'Sejarah',
      'Alun-Alun Tuban',
      'Monumen ini menggambarkan sosok Kuda Ronggolawe, yang merupakan simbol keberanian dan kesetiaan dari tokoh legendaris Tuban, Raden Wijaya (Ronggolawe). Berada tepat di tengah Alun-Alun Kota Tuban, monumen ini menjadi titik kumpul favorit warga sekaligus spot foto ikonik saat berkunjung ke Tuban.',
      'assets/images/monumen_kuda_ronggolawe.jpg'),
  buatInformasi(
      7,
      'Makam Sunan Bejagung Lor',
      'Sejarah',
      'Desa Bejagung, Semanding',
      'Makam Sunan Bejagung Lor merupakan salah satu situs ziarah wali lima (Wali Songo). Beliau adalah keponakan dari Sunan Ampel dan ikut berperan dalam syiar Islam di wilayah Tuban bagian selatan. Suasana di area makam sangat asri dan tenang, sangat cocok untuk merenung dan berdoa.',
      'assets/images/makam_sunan_bejagung_lor.jpg'),
  buatInformasi(
      8,
      'Makam Sunan Bejagung Kidul',
      'Sejarah',
      'Desa Bejagung, Semanding',
      'Berada tak jauh dari Makam Bejagung Lor, Makam Sunan Bejagung Kidul juga menjadi bagian dari rangkaian wisata religi di Tuban. Keduanya merupakan satu kesatuan situs sejarah penyebaran agama Islam. Area makam dilengkapi dengan gapura dan cungkup yang terawat baik.',
      'assets/images/makam_sunan_bejagung_kidul.jpg'),
  buatInformasi(
      9,
      'Makam Syekh Ibrahim Asmaraqandi',
      'Sejarah',
      'Desa Gesikharjo, Palang',
      'Makam Syekh Ibrahim Asmaraqandi (Syekh Ibrahim Asmoro) adalah situs religi yang sangat dihormati. Beliau merupakan ayah dari Sunan Ampel dan kakek dari Sunan Bonang. Ziarah ke makam ini sering dijadikan satu paket dengan ziarah ke makam Wali Songo lainnya di Tuban.',
      'assets/images/makam_syekh_ibrahim.jpg'),
  buatInformasi(
      10,
      'Patung Letda Sucipto',
      'Sejarah',
      'Kota Tuban',
      'Patung Letda Sucipto didirikan untuk menghormati jasa dan pengorbanan Letda Sucipto, seorang pahlawan asal Tuban yang gugur dalam peristiwa pemberontakan G30S/PKI. Patung ini menjadi monumen bersejarah yang menunjukkan rasa nasionalisme dan penghormatan terhadap jasa para pahlawan.',
      'assets/images/patung_letda_sucipto.jpg'),

  // ==========================================
  // WISATA
  // ==========================================
  buatInformasi(
      11,
      'Goa Ngerong',
      'Wisata',
      'Kecamatan Rengel, Tuban',
      'Goa Ngerong adalah wisata alam eksotis yang menyajikan pemandangan gua kapur dengan sungai bawah tanah yang sangat jernih. Di dalam sungai ini hidup ribuan ikan air tawar yang dilindungi dan sangat jinak. Pengunjung bisa memberi makan ikan-ikan tersebut. Di sekitar mulut gua, terdapat banyak kera ekor panjang yang berkeliaran dan siap menyambut wisatawan.',
      'assets/images/goa_ngerong.jpg'),
  buatInformasi(
      12,
      'Goa Akbar',
      'Wisata',
      'Kecamatan Semanding, Tuban',
      'Goa Akbar (Goa Alam Baru) adalah destinasi wisata alam bawah tanah yang menyuguhkan formasi stalaktit dan stalagmit yang indah. Gua ini sering dijadikan tempat edukasi geologi dan fotografi karena pencahayaan alami yang menakjubkan di dalamnya. Jalur masuk ke gua sudah ditata dengan tangga dan penerangan yang cukup.',
      'assets/images/goa_akbar.jpg'),
  buatInformasi(
      13,
      'Pantai Boom',
      'Wisata',
      'Kecamatan Tuban',
      'Pantai Boom adalah ikon wisata bahari Tuban yang terletak di pusat kota. Pantai ini dulunya merupakan pelabuhan pelayaran rakyat. Kini, kawasan ini telah disulap menjadi tempat wisata yang tertata apik. Pengunjung dapat menikmati pemandangan matahari terbit, berjalan santai di sepanjang dermaga, dan melihat aktivitas nelayan serta kapal tradisional.',
      'assets/images/pantai_boom.jpg'),
  buatInformasi(
      14,
      'Pantai Kelapa',
      'Wisata',
      'Panyuran, Kecamatan Palang',
      'Sesuai namanya, Pantai Kelapa menawarkan panorama pantai yang dihiasi deretan pohon kelapa hijau yang rindang. Ombaknya cukup tenang, sehingga aman untuk bermain air di tepian. Di sepanjang pantai, banyak tersedia warung makan yang menjajakan olahan seafood segar hasil tangkapan nelayan setempat.',
      'assets/images/pantai_kelapa.jpg'),
  buatInformasi(
      15,
      'Pantai Sowan',
      'Wisata',
      'Kecamatan Bancar, Tuban',
      'Pantai Sowan dikenal dengan pasirnya yang lembut dan hamparan laut luas yang memanjakan mata. Pantai ini sering dijadikan lokasi camping karena udaranya yang sejuk, terutama saat malam hari. Ada juga fasilitas gazebo-gazebo di tepi pantai untuk bersantai menikmati semilir angin laut.',
      'assets/images/pantai_sowan.jpg'),
  buatInformasi(
      16,
      'Pantai Pasir Putih Remen',
      'Wisata',
      'Remen, Kecamatan Jenu',
      'Pantai Pasir Putih Remen adalah salah satu pantai yang paling populer di Tuban. Sesuai namanya, pantai ini memiliki hamparan pasir putih yang bersih. Tempat ini sangat cocok untuk bermain pasir, berfoto dengan latar laut biru, dan menikmati kuliner khas pesisir di sekitar area pantai.',
      'assets/images/pantai_pasir_putih_remen.jpg'),
  buatInformasi(
      17,
      'Air Terjun Nglirip',
      'Wisata',
      'Kecamatan Singgahan, Tuban',
      'Air Terjun Nglirip adalah air terjun setinggi sekitar 15 meter yang dikelilingi oleh rimbunnya pepohonan hijau. Kolam di bawah air terjun sangat alami dan menyegarkan. Tempat ini sering dijadikan lokasi rekreasi keluarga untuk melepas penat dari hiruk-pikuk perkotaan.',
      'assets/images/air_terjun_nglirip.jpg'),
  buatInformasi(
      18,
      'Air Terjun Bongok',
      'Wisata',
      'Kecamatan Grabagan, Tuban',
      'Air Terjun Bongok menyuguhkan suasana alam yang masih sangat asri dan belum banyak terjamah. Untuk mencapai lokasi, pengunjung harus berjalan kaki sedikit melewati area persawahan dan hutan bambu. Sangat cocok untuk pecinta alam dan kegiatan tracking ringan.',
      'assets/images/air_terjun_bongok.jpg'),
  buatInformasi(
      19,
      'Wisata Pelang',
      'Wisata',
      'Kecamatan Merakurak, Tuban',
      'Wisata Pelang (Pemandian Pelang) adalah kawasan wisata air yang bersumber dari mata air alami. Tempat ini menyediakan kolam renang dan juga area pemandian alami yang dikelilingi pepohonan besar. Sangat digemari warga lokal untuk berenang dan piknik bersama keluarga.',
      'assets/images/wisata_pelang.jpg'),
  buatInformasi(
      20,
      'Pemandian Bektiharjo',
      'Wisata',
      'Kecamatan Semanding, Tuban',
      'Pemandian Bektiharjo adalah destinasi wisata air legendaris di Tuban. Mata airnya konon tidak pernah kering meskipun musim kemarau panjang. Fasilitas di sini sudah cukup lengkap, mulai dari kolam untuk anak-anak hingga kolam untuk orang dewasa, serta area taman yang luas.',
      'assets/images/pemandian_bektiharjo.jpg'),

  // ==========================================
  // BUDAYA
  // ==========================================
  buatInformasi(
      21,
      'Batik Gedog Tuban',
      'Budaya',
      'Kabupaten Tuban',
      'Batik Gedog adalah warisan budaya khas Tuban yang memiliki motif khas berupa tenun tangan dengan warna-warna khas seperti merah, biru, dan hitam. Motifnya banyak terinspirasi dari alam sekitardan cerita rakyat. Batik ini merupakan hasil akulturasi budaya Jawa dan budaya pendatang, dan masih diproduksi secara tradisional hingga kini.',
      'assets/images/batik_gedog_tuban.jpg'),
  buatInformasi(
      22,
      'Tenun Gedog',
      'Budaya',
      'Kecamatan Kerek, Tuban',
      'Tenun Gedog adalah kain tenun tradisional yang dibuat dari kapas asli menggunakan Alat Tenun Bukan Mesin (ATBM). Proses pembuatannya memakan waktu berhari-hari dan memerlukan ketelitian tinggi. Kain ini menjadi identitas Kabupaten Tuban yang mendunia dan sering dijadikan bahan pakaian adat atau suvenir.',
      'assets/images/tenun_gedog.jpg'),
  buatInformasi(
      23,
      'Kesenian Sandur',
      'Budaya',
      'Kabupaten Tuban',
      'Sandur adalah kesenian teater rakyat khas Tuban yang menggabungkan unsur musik, tari, dan lawakan. Pertunjukan ini biasanya ditampilkan pada acara-acara penting seperti khitanan, pernikahan, atau perayaan desa. Cerita yang dibawakan seringkali mengandung pesan moral dan nilai-nilai kehidupan.',
      'assets/images/kesenian_sandur.jpg'),
  buatInformasi(
      24,
      'Seni Tayub',
      'Budaya',
      'Kabupaten Tuban',
      'Seni Tayub adalah tarian tradisional Jawa yang biasanya ditampilkan sebagai bagian dari upacara adat atau syukuran desa. Tarian ini melibatkan interaksi antara penari dan pengunjung, diiringi alunan musik gamelan yang ritmis. Meskipun sempat dianggap tabu, Tayub kini dilestarikan sebagai aset seni budaya.',
      'assets/images/seni_tayub.jpg'),
  buatInformasi(
      25,
      'Wayang Kulit',
      'Budaya',
      'Kabupaten Tuban',
      'Wayang Kulit adalah salah satu warisan budaya dunia dari Indonesia. Di Tuban, seni pertunjukan wayang kulit masih sangat hidup. Dalang-dalang lokal sering menampilkan lakon-lakon pewayangan yang dikemas dengan gaya khas pesisiran, memberikan warna baru pada seni pedalangan Jawa.',
      'assets/images/wayang_kulit.jpg'),
  buatInformasi(
      26,
      'Tradisi Sedekah Bumi',
      'Budaya',
      'Kabupaten Tuban',
      'Sedekah Bumi adalah tradisi tahunan masyarakat petani sebagai ungkapan syukur atas melimpahnya hasil panen. Tradisi ini diwarnai dengan arak-arakan hasil bumi, doa bersama, serta pertunjukan seni budaya. Merupakan momen yang sangat mempererat tali persaudaraan warga desa.',
      'assets/images/tradisi_sedekah_bumi.jpg'),
  buatInformasi(
      27,
      'Haul Sunan Bonang',
      'Budaya',
      'Kecamatan Tuban',
      'Haul Sunan Bonang adalah acara peringatan tahunan wafatnya salah satu Wali Songo tersebut. Acara ini dihadiri oleh ribuan peziarah dari berbagai penjuru nusantara. Puncak acara biasanya berupa pembacaan tahlil dan doa bersama di kompleks makam.',
      'assets/images/haul_sunan_bonang.jpg'),
  buatInformasi(
      28,
      'Tradisi Tongklek',
      'Budaya',
      'Kabupaten Tuban',
      'Tongklek adalah tradisi musik perkusi yang dimainkan oleh warga menggunakan alat musik sederhana seperti kentongan dan bedug. Biasanya dimainkan pada saat bulan Ramadhan atau saat acara-acara budaya. Suaranya yang khas menjadi penanda dimulainya kegiatan masyarakat.',
      'assets/images/tradisi_tongklek.jpg'),
  buatInformasi(
      29,
      'Kerajinan Ongkek',
      'Budaya',
      'Kabupaten Tuban',
      'Kerajinan Ongkek adalah pembuatan aksesoris atau perhiasan tradisional dari bahan kuningan atau tembaga. Seni kerajinan ini sudah diwariskan dari generasi ke generasi. Hasilnya berupa gelang, cincin, dan hiasan yang sangat detail dan bernilai seni tinggi.',
      'assets/images/kerajinan_ongkek.jpg'),
  buatInformasi(
      30,
      'Desa Wisata Budaya Sukorejo',
      'Budaya',
      'Kecamatan Parengan, Tuban',
      'Sukorejo adalah desa wisata yang berhasil mengangkat potensi seni dan budayanya. Pengunjung dapat melihat langsung proses pembuatan kerajinan lokal, menikmati suasana pedesaan yang asri, serta menyaksikan pertunjukan kesenian tradisional dari warga setempat.',
      'assets/images/desa_wisata_budaya_sukorejo.jpg'),

  // ==========================================
  // KULINER
  // ==========================================
  buatInformasi(
      31,
      'Becek Menthok',
      'Kuliner',
      'Kabupaten Tuban',
      'Becek Menthok adalah hidangan khas Tuban yang terbuat dari daging bebek (menthok) yang dimasak dengan bumbu rempah pekat. Kuahnya mirip dengan kari atau opor, namun memiliki cita rasa khas yang kuat karena proses pemasakan yang lama. Sangat nikmat disantap dengan nasi hangat.',
      'assets/images/becek_menthok.jpg'),
  buatInformasi(
      32,
      'Kare Rajungan',
      'Kuliner',
      'Pesisir Tuban',
      'Kare Rajungan adalah hidangan laut mewah yang menjadi favorit wisatawan. Rajungan (kepiting laut) dimasak dengan kuah kari yang kaya rempah dan santan kental. Rasanya gurih, manis dari daging rajungan, dan sedikit pedas, mencerminkan kekayaan hasil laut Tuban.',
      'assets/images/kare_rajungan.jpg'),
  buatInformasi(
      33,
      'Belut Pedas',
      'Kuliner',
      'Kabupaten Tuban',
      'Belut Pedas adalah olahan belut sawah yang digoreng kering lalu dimasak dengan bumbu pedas manis. Meskipun terlihat sederhana, hidangan ini sangat digemari karena teksturnya yang renyah dan kaya akan protein. Cocok untuk pecinta makanan pedas.',
      'assets/images/belut_pedas.jpg'),
  buatInformasi(
      34,
      'Sate Bebek',
      'Kuliner',
      'Kabupaten Tuban',
      'Sate Bebek khas Tuban berbeda dengan sate ayam biasa. Daging bebek yang empuk ditusuk dan dibakar dengan olesan bumbu kecap dan rempah rahasia. Aroma khas daging bebek berpadu sempurna dengan bumbu kacang yang gurih.',
      'assets/images/sate_bebek.jpg'),
  buatInformasi(
      35,
      'Asem-Asem Ndas Manyung',
      'Kuliner',
      'Pesisir Tuban',
      'Asem-Asem Ndas Manyung adalah sup ikan khas pesisir dengan bahan utama kepala ikan manyung. Kuahnya bening dengan rasa asam segar dari belimbing wuluh atau asam jawa, dipadukan dengan bumbu rempah yang hangat. Hidangan ini sangat menyegarkan dan menggugah selera.',
      'assets/images/asem_asem_ndas_manyung.jpg'),
  buatInformasi(
      36,
      'Mangut Ikan Pe',
      'Kuliner',
      'Kabupaten Tuban',
      'Mangut Ikan Pe adalah olahan ikan pe (ikan asin khas pesisir) yang dimasak dengan kuah santan dan bumbu rempah. Rasanya gurih, pedas, dan sedikit asam. Hidangan ini sangat cocok disantap bersama nasi jagung atau nasi putih hangat.',
      'assets/images/mangut_ikan_pe.jpg'),
  buatInformasi(
      37,
      'Nasi Jagung',
      'Kuliner',
      'Kabupaten Tuban',
      'Nasi Jagung adalah makanan pokok alternatif masyarakat Tuban zaman dahulu. Terbuat dari jagung yang ditumbuk halus lalu dikukus. Biasanya disajikan dengan sayur lodeh, ikan asin, dan sambal terasi. Rasanya khas dan memberikan sensasi berbeda dari nasi biasa.',
      'assets/images/nasi_jagung.jpg'),
  buatInformasi(
      38,
      'Ampo Tuban',
      'Kuliner',
      'Kabupaten Tuban',
      'Ampo adalah camilan tradisional khas Tuban yang terbuat dari tanah liat murni pilihan! Meskipun terdengar aneh, ampo adalah camilan renyah yang diolah secara higienis dan dipercaya memiliki khasiat untuk kesehatan pencernaan. Camilan ini sudah menjadi ikon oleh-oleh dari Tuban.',
      'assets/images/ampo_tuban.jpg'),
  buatInformasi(
      39,
      'Legen Tuban',
      'Kuliner',
      'Kabupaten Tuban',
      'Legen adalah minuman tradisional manis dan segar yang berasal dari nira pohon siwalan (pohon lontar). Proses pengambilan nira dilakukan oleh petani secara tradisional. Rasanya manis alami, sedikit asam, dan sangat menyegarkan, terutama jika disajikan dalam keadaan dingin.',
      'assets/images/legen_tuban.jpg'),
  buatInformasi(
      40,
      'Dumbek',
      'Kuliner',
      'Kabupaten Tuban',
      'Dumbek adalah jajanan pasar tradisional khas Tuban yang terbuat dari campuran tepung beras, gula merah, dan kelapa parut. Bentuknya khas dan rasanya manis, legit, serta gurih. Jajanan ini sering dijumpai di pasar-pasar tradisional dan menjadi teman minum teh di sore hari.',
      'assets/images/dumbek.jpg'),
];
import '../models/level.dart';
import '../models/pertanyaan.dart';

final List<Level> levelData = [
  Level(
    id: 1,
    nama: 'Level 1',
    kategori: 'Sejarah Tuban',
    terkunci: false,
  ),
  Level(
    id: 2,
    nama: 'Level 2',
    kategori: 'Wisata Tuban',
    terkunci: true,
  ),
  Level(
    id: 3,
    nama: 'Level 3',
    kategori: 'Budaya Tuban',
    terkunci: true,
  ),
  Level(
    id: 4,
    nama: 'Level 4',
    kategori: 'Kuliner Tuban',
    terkunci: true,
  ),
];

final List<Pertanyaan> pertanyaanData = [
  // LEVEL 1 - SEJARAH
  Pertanyaan(
    id: 1,
    levelId: 1,
    pertanyaan: 'Museum Kambang Putih berada di daerah mana?',
    pilihan: [
      'Tuban',
      'Bojonegoro',
      'Lamongan',
      'Rembang',
    ],
    jawabanBenar: 0,
  ),

  Pertanyaan(
    id: 2,
    levelId: 1,
    pertanyaan: 'Tuban dikenal sebagai salah satu daerah di provinsi apa?',
    pilihan: [
      'Jawa Barat',
      'Jawa Timur',
      'Jawa Tengah',
      'Bali',
    ],
    jawabanBenar: 1,
  ),

  // LEVEL 2 - WISATA
  Pertanyaan(
    id: 3,
    levelId: 2,
    pertanyaan: 'Goa Ngerong berada di kecamatan mana?',
    pilihan: [
      'Rengel',
      'Jenu',
      'Palang',
      'Kerek',
    ],
    jawabanBenar: 0,
  ),

  Pertanyaan(
    id: 4,
    levelId: 2,
    pertanyaan: 'Pantai Boom merupakan tempat wisata yang berada di wilayah?',
    pilihan: [
      'Pegunungan',
      'Pesisir',
      'Perkebunan',
      'Persawahan',
    ],
    jawabanBenar: 1,
  ),

  // LEVEL 3 - BUDAYA
  Pertanyaan(
    id: 5,
    levelId: 3,
    pertanyaan: 'Tari merupakan salah satu bentuk dari kebudayaan berupa?',
    pilihan: [
      'Kesenian',
      'Pertanian',
      'Perdagangan',
      'Teknologi',
    ],
    jawabanBenar: 0,
  ),

  Pertanyaan(
    id: 6,
    levelId: 3,
    pertanyaan: 'Kesenian tradisional dapat menjadi bagian dari identitas suatu daerah.',
    pilihan: [
      'Benar',
      'Salah',
      'Tidak tahu',
      'Tidak keduanya',
    ],
    jawabanBenar: 0,
  ),

  // LEVEL 4 - KULINER
  Pertanyaan(
    id: 7,
    levelId: 4,
    pertanyaan: 'Nasi Becek merupakan salah satu jenis?',
    pilihan: [
      'Makanan',
      'Minuman',
      'Kerajinan',
      'Kesenian',
    ],
    jawabanBenar: 0,
  ),

  Pertanyaan(
    id: 8,
    levelId: 4,
    pertanyaan: 'Kuliner khas daerah merupakan bagian dari kekayaan budaya.',
    pilihan: [
      'Benar',
      'Salah',
      'Tidak tahu',
      'Tidak keduanya',
    ],
    jawabanBenar: 0,
  ),
];
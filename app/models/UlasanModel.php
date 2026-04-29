<?php

class UlasanModel
{
    private PDO $pdo;

    public function __construct(PDO $pdo)
    {
        $this->pdo = $pdo;
    }

    public function getAll(array $filter = []): array
    {
        $sql = "SELECT u.*, w.nama AS nama_wisata
                FROM ulasan u
                LEFT JOIN wisata w ON u.wisata_id = w.id
                WHERE 1=1";
        $params = [];

        if (!empty($filter['wisata_id'])) {
            $sql .= " AND u.wisata_id = :wisata_id";
            $params[':wisata_id'] = $filter['wisata_id'];
        }

        $sql .= " ORDER BY u.created_at DESC";

        $stmt = $this->pdo->prepare($sql);
        $stmt->execute($params);
        return $stmt->fetchAll();
    }

    public function getPublik(int $wisataId): array
    {
        return $this->getAll(['wisata_id' => $wisataId]);
    }

    public function getMenunggu(): array
    {
        return $this->getAll();
    }

    public function getById(int $id): ?array
    {
        $stmt = $this->pdo->prepare(
            "SELECT u.*, w.nama AS nama_wisata
             FROM ulasan u LEFT JOIN wisata w ON u.wisata_id = w.id
             WHERE u.id = :id"
        );
        $stmt->execute([':id' => $id]);
        $row = $stmt->fetch();
        return $row ?: null;
    }

    public function create(array $data): bool
    {
        $stmt = $this->pdo->prepare(
            "INSERT INTO ulasan (wisata_id, nama_pengunjung, email, rating, judul, isi_ulasan, foto, status)
             VALUES (:wisata_id, :nama_pengunjung, :email, :rating, :judul, :isi_ulasan, :foto, :status)"
        );
        return $stmt->execute($data);
    }

    public function updateStatus(int $id, string $status): bool
    {
        $stmt = $this->pdo->prepare("UPDATE ulasan SET status = :status WHERE id = :id");
        return $stmt->execute([':status' => $status, ':id' => $id]);
    }

    public function update(int $id, array $data): bool
    {
        $data[':id'] = $id;
        $stmt = $this->pdo->prepare(
            "UPDATE ulasan SET
             wisata_id=:wisata_id, nama_pengunjung=:nama_pengunjung, email=:email,
             rating=:rating, judul=:judul, isi_ulasan=:isi_ulasan, status=:status
             WHERE id=:id"
        );
        return $stmt->execute($data);
    }

    public function delete(int $id): bool
    {
        $stmt = $this->pdo->prepare("DELETE FROM ulasan WHERE id = :id");
        return $stmt->execute([':id' => $id]);
    }

    public function avgRating(int $wisataId): float
    {
        $stmt = $this->pdo->prepare(
            "SELECT AVG(rating) FROM ulasan WHERE wisata_id = :id"
        );
        $stmt->execute([':id' => $wisataId]);
        return round((float) $stmt->fetchColumn(), 1);
    }

    public function countByWisata(int $wisataId): int
    {
        $stmt = $this->pdo->prepare(
            "SELECT COUNT(*) FROM ulasan WHERE wisata_id = :id"
        );
        $stmt->execute([':id' => $wisataId]);
        return (int) $stmt->fetchColumn();
    }

    public function count(array $filter = []): int
    {
        $sql    = "SELECT COUNT(*) FROM ulasan WHERE 1=1";
        $stmt = $this->pdo->prepare($sql);
        $stmt->execute([]);
        return (int) $stmt->fetchColumn();
    }
}
# Karabiner（keymap）設定ドキュメント

---
- [Karabiner（keymap）設定ドキュメント](#karabinerkeymap設定ドキュメント)
  - [keymapを用いていること](#keymapを用いていること)
  - [keymapのインストール方法と編集方法](#keymapのインストール方法と編集方法)
    - [インストール](#インストール)
    - [keymapファイルの配置・読み込み](#keymapファイルの配置読み込み)
  - [キーの変更項目（①〜④）](#キーの変更項目)
  - [Karabinerでの有効化 / 無効化について 🔧](#karabinerでの有効化--無効化について-)

## keymapを用いていること

本設定では、macOS上でキー入力や入力ソース切替を柔軟に制御するため、**Karabiner-Elements（以下 Karabiner）** を用いてキーマップを実装している。

このリポジトリの `karabiner-config/` 内にある **4つの JSON 設定** を読み取り、それぞれをルールとして管理している。

---

## keymapのインストール方法と編集方法

### インストール
1. https://karabiner-elements.pqrs.org/ にアクセス
2. 最新の **Karabiner-Elements** をダウンロードしてインストール
3. システム環境設定から Karabiner にフルディスクアクセスと入力監視の許可を与える（初回起動時の案内に従う）

### keymapファイルの配置・読み込み
1. このリポジトリの `keymap-mac/karabiner-config/` にある `config_01.json` 〜 `config_04.json` を確認
2. Karabiner の設定フォルダ（通常 `~/.config/karabiner/assets/complex_modifications/`）にこれらの JSON をコピー
3. Karabiner のメニュー → **Complex Modifications** → **Add rule** を開き、コピーしたルールを有効化
4. 変更後は Karabiner が自動的に反映するが、必要なら `karabiner --reload`（`karabiner_cli`）やアプリの再起動で適用する

---

## キーの変更項目（①〜④）

下記は `karabiner-config/` 内の 4 つの設定ファイルからそのまま読み取って作成した項目である。

①  左Command + 左Shift + `4` → 前方削除（Delete Forward）

- ファイル: `config_01.json`
- 説明: `left_command` と `left_shift` を同時に押しながら `4` を押すと、`delete_forward` が送出される（前方削除）

②  Page Up / Page Down → コピー / 貼り付け（Cmd+C / Cmd+V）

- ファイル: `config_02.json`
- 説明: `page_up` を押すと `⌘C`（Copy）、`page_down` を押すと `⌘V`（Paste）を送出する

③  Home → `~`（チルダ）

- ファイル: `config_03.json`
- 説明: `home` キーを押すと `grave_accent_and_tilde`（チルダ／バッククォート）が送出される

④  `grave_accent_and_tilde`（バッククォート）で入力ソース（日本語↔英語）切替

- ファイル: `config_04.json`
- 説明: 現在の入力ソースが日本語（language: `^ja$`）のときに `grave_accent_and_tilde` を押すと英語（`^en$`）に切り替え、英語のときに押すと日本語に切り替える

---

## Karabinerでの有効化 / 無効化について 🔧

- Karabiner の **Complex Modifications** から各ルールを個別に有効 / 無効にできる
- ファイルごとにグループ管理しているため、無効にしたいルールだけをオフにすれば良い
- `config_04.json` のような入力ソース条件付きのルールは、動作環境（システムの入力ソース設定）に依存する点に注意

> **補足:** 必要なら各ルールに説明（`description`）を追記したり、画像や具体例を `images/` に追加してドキュメントを拡充してください ✅

---

このドキュメントは `karabiner-config/` 内の JSON を元に作成しました。追加のルールを作成したい場合は同ディレクトリに JSON を追加し、上記の手順で Karabiner に読み込ませてください。

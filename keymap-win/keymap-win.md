# AutoHotkey（keymap）設定ドキュメント

---
- [AutoHotkey（keymap）設定ドキュメント](#autohotkeykeymap設定ドキュメント)
  - [keymapを用いていること](#keymapを用いていること)
  - [keymapのインストール方法と編集方法](#keymapのインストール方法と編集方法)
    - [インストール](#インストール)
    - [keymapファイルの作成・編集](#keymapファイルの作成編集)
  - [キーの変更項目（①〜⑥）](#キーの変更項目)
  - [トグルによるキーマップのON / OFFについて](#トグルによるキーマップのon--offについて)

## keymapを用いていること

本設定では、Windows上でキー入力を柔軟に制御するため  
**AutoHotkey（AHK）** を用いてキーマップを実装している。

PowerToysでは実現できない  
- キー割り当ての連鎖制御  
- 条件付き（アプリ限定）動作  
- トグルによるON/OFF切り替え  

を目的として、AHKを採用している。

---

## keymapのインストール方法と編集方法

### インストール
1. https://www.autohotkey.com/ にアクセス
2. **AutoHotkey v1.1（LTS / Legacy）** をダウンロード
3. インストーラを実行し **Express Installation** を選択

### keymapファイルの作成・編集
1. 任意の場所（例：デスクトップ）に `keymap.ahk` を作成
2. 右クリック → **編集** で内容を編集
3. 保存後、`keymap.ahk` をダブルクリックで有効化
4. 変更時はタスクトレイの **緑のHアイコン → Reload Script**

---

## キーの変更項目（①〜⑥）



① 
`Esc`を `` ` `` （バッククォート）に

![キー変換①](images/keymap-win_01.png)

② `Home`（通常のHomeキー）を `` ` ``（バッククォート）に

![キー変換①](images/keymap-win_02.png)

③ `End`を`Esc`（本来のEsc、連鎖なし）
に
![キー変換①](images/keymap-win_03.png)

④ `` ` ``（物理キー）を `IME ON / OFF` 切り替えに
![キー変換①](images/keymap-win_04.png)

①～④はトグル（`Ctrl` + `Alt` + `o`）でON / OFF 切り替えが可能

⑤ Chrome タブ移動（常時有効）

![キー変換①](images/keymap-win_05.png)

⑥ Chrome ページ移動（常時有効・右Ctrl限定）

![キー変換①](images/keymap-win_06.png)


---

## トグルによるキーマップのON / OFFについて

①〜③ のキーマップを`Ctrl` + `Alt` + `o`で ON / OFF 切り替えが可能

- トグル対象：① Esc、② Home、③ End、④ `
- トグル非対象：⑤、⑥（常時有効）
- トグル操作時は、現在の状態（ON / OFF）が通知表示される
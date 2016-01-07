# 使用 NS_OPTION 來實作按鈕狀態的測試案例

![建立者](https://img.shields.io/badge/建立者-Coody-orange.svg)
![License](https://img.shields.io/dub/l/vibe-d.svg)

>此專案用來說明畫面上按鈕是否開啟/關閉時，使用位元比對、以及 NS_OPTION 實作的小技巧。

# 說明

>畫面上常常要監控在某些情況下，才讓使用者可以按按鈕的功能，有時候判斷的點很多，可能是字串不能為空、可能是某些按鈕要打勾、或是多個空格要填完以及符合規定等，使用 NS_OPTION 來管理按鈕是否打開（自己寫 setter 將打開的邏輯寫在裡面），另外用位元比對方式來減少要判斷多個變數問題。

>簡單來說，可以想像這個按鈕有一個總開關管理，這個總開關有多個小開關，當每個小開關都等於一個判斷過後的結果，達成的時候就打開這個小開關，然後由總開關會決定要不要打開按鈕、或是關閉按鈕。

### License

ButtonOption is available under the MIT license.


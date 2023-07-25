import UIKit

//プロトコルの実装
//デリゲートメソッドを定義
protocol ButtonDelegate{
    func audio()
    func background()
}

//処理を任せる側の実装
//処理の流れを記述
class Button{
    var delegate:ButtonDelegate?=nil
    func click(){
        print("ボタンが押されました")
        //オプショナルバインディング delegateがnilじゃなかったら実行
        if let dg = self.delegate{
            dg.audio()
            dg.background()
        }else{
            print("何もしません")
        }
    }
}

//処理を任される側の処理
//デリゲートメソッドを実装
class Button1:ButtonDelegate{
    func audio() {
        print("音１を鳴らします")
    }
    func background() {
        print("背景１を表示します")
    }
}

//実行
let button = Button()

let button1 = Button1()
//Button1クラスのインスタンスに処理を任せる宣言
button.delegate = button1
button.click()

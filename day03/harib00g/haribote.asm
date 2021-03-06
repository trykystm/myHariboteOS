        ;=======================================================================
        ORG     0xc200      ; 0xc200 = 0x8000 + 0x4200
                            ; イメージファイルの 0x4200 アドレス番目に書き込まれている
                            ; また,先で 0x8000 以降を使うことに決めている

        ;=======================================================================
        ; [INT(0x10); ビデオ関係](http://oswiki.osask.jp/?%28AT%29BIOS#n5884802)
        ; ビデオモード設定
        ;   AH = 0x00;
        ;   AL = モード： (マイナーな画面モードは省略しています)
        ;     0x03：16色テキスト、80x25
        ;     0x12：VGAグラフィックス、640x480x4bitカラー、独自プレーンアクセス
        ;     0x13：VGAグラフィックス、320x200x8bitカラー、パックドピクセル
        ;     0x6a：拡張VGAグラフィックス、800x600x4bitカラー、独自プレーンアクセス（ビデオカードによってはサポートされない）
        ;   戻り値：なし
        MOV     AL, 0x13    ; VGA graphics, 320x200x(8 bit color)
        MOV     AH, 0x00
        INT     0x10

fin:
        HLT
        JMP     fin

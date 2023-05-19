(module
  (type $t0 (func (result i32)))
  (type $t1 (func (param i32)))
  (type $t2 (func))
  (type $t3 (func (param i32) (result i32)))
  (func $f0 (type $t2)
    (call $emscripten_stack_init))
  (func $f1 (type $t1) (param $p0 i32)
    (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i32) (local $l10 i32) (local $l11 i32) (local $l12 i32) (local $l13 i32) (local $l14 i32) (local $l15 i32) (local $l16 i32) (local $l17 i32) (local $l18 i32) (local $l19 i32) (local $l20 i32) (local $l21 i32) (local $l22 i32) (local $l23 i32) (local $l24 i32) (local $l25 i32) (local $l26 i32) (local $l27 i32) (local $l28 i32) (local $l29 i32) (local $l30 i32) (local $l31 i32) (local $l32 i32) (local $l33 i32) (local $l34 i32) (local $l35 i32) (local $l36 i32) (local $l37 i32) (local $l38 i32) (local $l39 i32) (local $l40 i32) (local $l41 i32) (local $l42 i32) (local $l43 i32) (local $l44 i32) (local $l45 i32) (local $l46 i32) (local $l47 i32) (local $l48 i32) (local $l49 i32) (local $l50 i32) (local $l51 i32) (local $l52 i32) (local $l53 i32) (local $l54 i32) (local $l55 i32) (local $l56 i32) (local $l57 i32) (local $l58 i32) (local $l59 i32)
    (local.set $l1
      (global.get $g0))
    (local.set $l2
      (i32.const 16))
    (local.set $l3
      (i32.sub
        (local.get $l1)
        (local.get $l2)))
    (i32.store offset=12
      (local.get $l3)
      (local.get $p0))
    (local.set $l4
      (i32.const 0))
    (i32.store offset=8
      (local.get $l3)
      (local.get $l4))
    (block $B0
      (loop $L1
        (local.set $l5
          (i32.load offset=8
            (local.get $l3)))
        (local.set $l6
          (i32.const 26))
        (local.set $l7
          (local.get $l5))
        (local.set $l8
          (local.get $l6))
        (local.set $l9
          (i32.lt_s
            (local.get $l7)
            (local.get $l8)))
        (local.set $l10
          (i32.const 1))
        (local.set $l11
          (i32.and
            (local.get $l9)
            (local.get $l10)))
        (br_if $B0
          (i32.eqz
            (local.get $l11)))
        (local.set $l12
          (i32.load offset=8
            (local.get $l3)))
        (local.set $l13
          (i32.const 4))
        (local.set $l14
          (i32.add
            (local.get $l12)
            (local.get $l13)))
        (local.set $l15
          (i32.const 8))
        (local.set $l16
          (i32.rem_s
            (local.get $l14)
            (local.get $l15)))
        (i32.store offset=4
          (local.get $l3)
          (local.get $l16))
        (local.set $l17
          (i32.load offset=8
            (local.get $l3)))
        (local.set $l18
          (i32.const 1024))
        (local.set $l19
          (i32.const 2))
        (local.set $l20
          (i32.shl
            (local.get $l17)
            (local.get $l19)))
        (local.set $l21
          (i32.add
            (local.get $l18)
            (local.get $l20)))
        (local.set $l22
          (i32.load
            (local.get $l21)))
        (local.set $l23
          (i32.load offset=12
            (local.get $l3)))
        (local.set $l24
          (i32.load offset=4
            (local.get $l3)))
        (local.set $l25
          (i32.const 2))
        (local.set $l26
          (i32.shl
            (local.get $l24)
            (local.get $l25)))
        (local.set $l27
          (i32.add
            (local.get $l23)
            (local.get $l26)))
        (local.set $l28
          (i32.load
            (local.get $l27)))
        (local.set $l29
          (i32.xor
            (local.get $l22)
            (local.get $l28)))
        (local.set $l30
          (i32.load offset=8
            (local.get $l3)))
        (local.set $l31
          (i32.const 1136))
        (local.set $l32
          (i32.const 2))
        (local.set $l33
          (i32.shl
            (local.get $l30)
            (local.get $l32)))
        (local.set $l34
          (i32.add
            (local.get $l31)
            (local.get $l33)))
        (i32.store
          (local.get $l34)
          (local.get $l29))
        (local.set $l35
          (i32.load offset=8
            (local.get $l3)))
        (local.set $l36
          (i32.const 1))
        (local.set $l37
          (i32.add
            (local.get $l35)
            (local.get $l36)))
        (i32.store offset=8
          (local.get $l3)
          (local.get $l37))
        (br $L1))
      (unreachable))
    (local.set $l38
      (i32.const 0))
    (i32.store
      (local.get $l3)
      (local.get $l38))
    (block $B2
      (loop $L3
        (local.set $l39
          (i32.load
            (local.get $l3)))
        (local.set $l40
          (i32.const 26))
        (local.set $l41
          (local.get $l39))
        (local.set $l42
          (local.get $l40))
        (local.set $l43
          (i32.lt_s
            (local.get $l41)
            (local.get $l42)))
        (local.set $l44
          (i32.const 1))
        (local.set $l45
          (i32.and
            (local.get $l43)
            (local.get $l44)))
        (br_if $B2
          (i32.eqz
            (local.get $l45)))
        (local.set $l46
          (i32.load
            (local.get $l3)))
        (local.set $l47
          (i32.const 1136))
        (local.set $l48
          (i32.const 2))
        (local.set $l49
          (i32.shl
            (local.get $l46)
            (local.get $l48)))
        (local.set $l50
          (i32.add
            (local.get $l47)
            (local.get $l49)))
        (local.set $l51
          (i32.load
            (local.get $l50)))
        (local.set $l52
          (i32.load offset=12
            (local.get $l3)))
        (local.set $l53
          (i32.load
            (local.get $l3)))
        (local.set $l54
          (i32.const 2))
        (local.set $l55
          (i32.shl
            (local.get $l53)
            (local.get $l54)))
        (local.set $l56
          (i32.add
            (local.get $l52)
            (local.get $l55)))
        (i32.store
          (local.get $l56)
          (local.get $l51))
        (local.set $l57
          (i32.load
            (local.get $l3)))
        (local.set $l58
          (i32.const 1))
        (local.set $l59
          (i32.add
            (local.get $l57)
            (local.get $l58)))
        (i32.store
          (local.get $l3)
          (local.get $l59))
        (br $L3))
      (unreachable))
    (return))
  (func $f2 (type $t1) (param $p0 i32)
    (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i32) (local $l10 i32) (local $l11 i32) (local $l12 i32) (local $l13 i32) (local $l14 i32) (local $l15 i32) (local $l16 i32) (local $l17 i32) (local $l18 i32) (local $l19 i32) (local $l20 i32) (local $l21 i32) (local $l22 i32) (local $l23 i32) (local $l24 i32) (local $l25 i32)
    (local.set $l1
      (global.get $g0))
    (local.set $l2
      (i32.const 16))
    (local.set $l3
      (i32.sub
        (local.get $l1)
        (local.get $l2)))
    (i32.store offset=12
      (local.get $l3)
      (local.get $p0))
    (local.set $l4
      (i32.const 0))
    (i32.store offset=8
      (local.get $l3)
      (local.get $l4))
    (block $B0
      (loop $L1
        (local.set $l5
          (i32.load offset=8
            (local.get $l3)))
        (local.set $l6
          (i32.const 26))
        (local.set $l7
          (local.get $l5))
        (local.set $l8
          (local.get $l6))
        (local.set $l9
          (i32.lt_s
            (local.get $l7)
            (local.get $l8)))
        (local.set $l10
          (i32.const 1))
        (local.set $l11
          (i32.and
            (local.get $l9)
            (local.get $l10)))
        (br_if $B0
          (i32.eqz
            (local.get $l11)))
        (local.set $l12
          (i32.load offset=8
            (local.get $l3)))
        (local.set $l13
          (i32.const 1248))
        (local.set $l14
          (i32.const 2))
        (local.set $l15
          (i32.shl
            (local.get $l12)
            (local.get $l14)))
        (local.set $l16
          (i32.add
            (local.get $l13)
            (local.get $l15)))
        (local.set $l17
          (i32.load
            (local.get $l16)))
        (local.set $l18
          (i32.load offset=12
            (local.get $l3)))
        (local.set $l19
          (i32.load offset=8
            (local.get $l3)))
        (local.set $l20
          (i32.const 2))
        (local.set $l21
          (i32.shl
            (local.get $l19)
            (local.get $l20)))
        (local.set $l22
          (i32.add
            (local.get $l18)
            (local.get $l21)))
        (i32.store
          (local.get $l22)
          (local.get $l17))
        (local.set $l23
          (i32.load offset=8
            (local.get $l3)))
        (local.set $l24
          (i32.const 1))
        (local.set $l25
          (i32.add
            (local.get $l23)
            (local.get $l24)))
        (i32.store offset=8
          (local.get $l3)
          (local.get $l25))
        (br $L1))
      (unreachable))
    (return))
  (func $check (export "check") (type $t1) (param $p0 i32)
    (local $l1 i32) (local $l2 i32) (local $l3 i32) (local $l4 i32) (local $l5 i32) (local $l6 i32) (local $l7 i32) (local $l8 i32) (local $l9 i32) (local $l10 i32) (local $l11 i32) (local $l12 i32) (local $l13 i32) (local $l14 i32) (local $l15 i32) (local $l16 i32) (local $l17 i32) (local $l18 i32) (local $l19 i32) (local $l20 i32) (local $l21 i32) (local $l22 i32) (local $l23 i32) (local $l24 i32) (local $l25 i32) (local $l26 i32) (local $l27 i32) (local $l28 i32) (local $l29 i32) (local $l30 i32) (local $l31 i32) (local $l32 i32) (local $l33 i32) (local $l34 i32) (local $l35 i32) (local $l36 i32) (local $l37 i32) (local $l38 i32) (local $l39 i32) (local $l40 i32) (local $l41 i32) (local $l42 i32) (local $l43 i32) (local $l44 i32) (local $l45 i32) (local $l46 i32) (local $l47 i32) (local $l48 i32) (local $l49 i32) (local $l50 i32) (local $l51 i32) (local $l52 i32) (local $l53 i32) (local $l54 i32) (local $l55 i32) (local $l56 i32) (local $l57 i32) (local $l58 i32) (local $l59 i32) (local $l60 i32) (local $l61 i32) (local $l62 i32) (local $l63 i32) (local $l64 i32) (local $l65 i32) (local $l66 i32) (local $l67 i32) (local $l68 i32) (local $l69 i32) (local $l70 i32) (local $l71 i32) (local $l72 i32) (local $l73 i32) (local $l74 i32) (local $l75 i32) (local $l76 i32) (local $l77 i32) (local $l78 i32) (local $l79 i32) (local $l80 i32) (local $l81 i32) (local $l82 i32) (local $l83 i32) (local $l84 i32) (local $l85 i32) (local $l86 i32) (local $l87 i32) (local $l88 i32) (local $l89 i32) (local $l90 i32) (local $l91 i32) (local $l92 i32) (local $l93 i32) (local $l94 i32) (local $l95 i32)
    (local.set $l1
      (global.get $g0))
    (local.set $l2
      (i32.const 16))
    (local.set $l3
      (i32.sub
        (local.get $l1)
        (local.get $l2)))
    (global.set $g0
      (local.get $l3))
    (i32.store offset=12
      (local.get $l3)
      (local.get $p0))
    (local.set $l4
      (i32.const 48))
    (i32.store offset=8
      (local.get $l3)
      (local.get $l4))
    (local.set $l5
      (i32.load offset=12
        (local.get $l3)))
    (local.set $l6
      (i32.load
        (local.get $l5)))
    (local.set $l7
      (i32.load offset=8
        (local.get $l3)))
    (local.set $l8
      (i32.const 2))
    (local.set $l9
      (i32.add
        (local.get $l7)
        (local.get $l8)))
    (local.set $l10
      (local.get $l6))
    (local.set $l11
      (local.get $l9))
    (local.set $l12
      (i32.ne
        (local.get $l10)
        (local.get $l11)))
    (local.set $l13
      (i32.const 1))
    (local.set $l14
      (i32.and
        (local.get $l12)
        (local.get $l13)))
    (block $B0
      (block $B1
        (br_if $B1
          (i32.eqz
            (local.get $l14)))
        (local.set $l15
          (i32.load offset=12
            (local.get $l3)))
        (call $f2
          (local.get $l15))
        (br $B0))
      (local.set $l16
        (i32.load offset=12
          (local.get $l3)))
      (local.set $l17
        (i32.load
          (local.get $l16)))
      (i32.store offset=8
        (local.get $l3)
        (local.get $l17))
      (local.set $l18
        (i32.load offset=12
          (local.get $l3)))
      (local.set $l19
        (i32.load offset=4
          (local.get $l18)))
      (local.set $l20
        (i32.load offset=8
          (local.get $l3)))
      (local.set $l21
        (i32.const 7))
      (local.set $l22
        (i32.add
          (local.get $l20)
          (local.get $l21)))
      (local.set $l23
        (local.get $l19))
      (local.set $l24
        (local.get $l22))
      (local.set $l25
        (i32.eq
          (local.get $l23)
          (local.get $l24)))
      (local.set $l26
        (i32.const 1))
      (local.set $l27
        (i32.and
          (local.get $l25)
          (local.get $l26)))
      (block $B2
        (block $B3
          (br_if $B3
            (i32.eqz
              (local.get $l27)))
          (local.set $l28
            (i32.load offset=12
              (local.get $l3)))
          (local.set $l29
            (i32.load offset=4
              (local.get $l28)))
          (i32.store offset=8
            (local.get $l3)
            (local.get $l29))
          (local.set $l30
            (i32.load offset=12
              (local.get $l3)))
          (local.set $l31
            (i32.load offset=8
              (local.get $l30)))
          (local.set $l32
            (i32.load offset=8
              (local.get $l3)))
          (local.set $l33
            (i32.const 3))
          (local.set $l34
            (i32.sub
              (local.get $l32)
              (local.get $l33)))
          (local.set $l35
            (local.get $l31))
          (local.set $l36
            (local.get $l34))
          (local.set $l37
            (i32.ne
              (local.get $l35)
              (local.get $l36)))
          (local.set $l38
            (i32.const 1))
          (local.set $l39
            (i32.and
              (local.get $l37)
              (local.get $l38)))
          (block $B4
            (br_if $B4
              (i32.eqz
                (local.get $l39)))
            (local.set $l40
              (i32.load offset=12
                (local.get $l3)))
            (call $f2
              (local.get $l40))
            (br $B0))
          (local.set $l41
            (i32.load offset=12
              (local.get $l3)))
          (local.set $l42
            (i32.load offset=8
              (local.get $l41)))
          (i32.store offset=8
            (local.get $l3)
            (local.get $l42))
          (local.set $l43
            (i32.load offset=12
              (local.get $l3)))
          (local.set $l44
            (i32.load offset=12
              (local.get $l43)))
          (local.set $l45
            (i32.load offset=8
              (local.get $l3)))
          (local.set $l46
            (local.get $l44))
          (local.set $l47
            (local.get $l45))
          (local.set $l48
            (i32.eq
              (local.get $l46)
              (local.get $l47)))
          (local.set $l49
            (i32.const 1))
          (local.set $l50
            (i32.and
              (local.get $l48)
              (local.get $l49)))
          (block $B5
            (br_if $B5
              (i32.eqz
                (local.get $l50)))
            (local.set $l51
              (i32.load offset=12
                (local.get $l3)))
            (local.set $l52
              (i32.load offset=16
                (local.get $l51)))
            (local.set $l53
              (i32.load offset=8
                (local.get $l3)))
            (local.set $l54
              (i32.const 6))
            (local.set $l55
              (i32.sub
                (local.get $l53)
                (local.get $l54)))
            (local.set $l56
              (local.get $l52))
            (local.set $l57
              (local.get $l55))
            (local.set $l58
              (i32.eq
                (local.get $l56)
                (local.get $l57)))
            (local.set $l59
              (i32.const 1))
            (local.set $l60
              (i32.and
                (local.get $l58)
                (local.get $l59)))
            (block $B6
              (br_if $B6
                (i32.eqz
                  (local.get $l60)))
              (local.set $l61
                (i32.load offset=12
                  (local.get $l3)))
              (local.set $l62
                (i32.load offset=20
                  (local.get $l61)))
              (local.set $l63
                (i32.load offset=8
                  (local.get $l3)))
              (local.set $l64
                (i32.const 5))
              (local.set $l65
                (i32.sub
                  (local.get $l63)
                  (local.get $l64)))
              (local.set $l66
                (local.get $l62))
              (local.set $l67
                (local.get $l65))
              (local.set $l68
                (i32.eq
                  (local.get $l66)
                  (local.get $l67)))
              (local.set $l69
                (i32.const 1))
              (local.set $l70
                (i32.and
                  (local.get $l68)
                  (local.get $l69)))
              (block $B7
                (br_if $B7
                  (i32.eqz
                    (local.get $l70)))
                (local.set $l71
                  (i32.load offset=12
                    (local.get $l3)))
                (local.set $l72
                  (i32.load offset=24
                    (local.get $l71)))
                (local.set $l73
                  (i32.load offset=8
                    (local.get $l3)))
                (local.set $l74
                  (i32.const 2))
                (local.set $l75
                  (i32.sub
                    (local.get $l73)
                    (local.get $l74)))
                (local.set $l76
                  (local.get $l72))
                (local.set $l77
                  (local.get $l75))
                (local.set $l78
                  (i32.eq
                    (local.get $l76)
                    (local.get $l77)))
                (local.set $l79
                  (i32.const 1))
                (local.set $l80
                  (i32.and
                    (local.get $l78)
                    (local.get $l79)))
                (br_if $B7
                  (i32.eqz
                    (local.get $l80)))
                (local.set $l81
                  (i32.load offset=12
                    (local.get $l3)))
                (local.set $l82
                  (i32.load offset=28
                    (local.get $l81)))
                (local.set $l83
                  (i32.load offset=8
                    (local.get $l3)))
                (local.set $l84
                  (i32.const 1))
                (local.set $l85
                  (i32.sub
                    (local.get $l83)
                    (local.get $l84)))
                (local.set $l86
                  (local.get $l82))
                (local.set $l87
                  (local.get $l85))
                (local.set $l88
                  (i32.eq
                    (local.get $l86)
                    (local.get $l87)))
                (local.set $l89
                  (i32.const 1))
                (local.set $l90
                  (i32.and
                    (local.get $l88)
                    (local.get $l89)))
                (br_if $B7
                  (i32.eqz
                    (local.get $l90)))
                (local.set $l91
                  (i32.load offset=12
                    (local.get $l3)))
                (call $f1
                  (local.get $l91))
                (br $B0))))
          (br $B2))
        (local.set $l92
          (i32.load offset=12
            (local.get $l3)))
        (call $f2
          (local.get $l92))
        (br $B0))
      (local.set $l93
        (i32.load offset=12
          (local.get $l3)))
      (call $f2
        (local.get $l93)))
    (local.set $l94
      (i32.const 16))
    (local.set $l95
      (i32.add
        (local.get $l3)
        (local.get $l94)))
    (global.set $g0
      (local.get $l95))
    (return))
  (func $stackSave (export "stackSave") (type $t0) (result i32)
    (global.get $g0))
  (func $stackRestore (export "stackRestore") (type $t1) (param $p0 i32)
    (global.set $g0
      (local.get $p0)))
  (func $stackAlloc (export "stackAlloc") (type $t3) (param $p0 i32) (result i32)
    (local $l1 i32) (local $l2 i32)
    (global.set $g0
      (local.tee $l1
        (i32.and
          (i32.sub
            (global.get $g0)
            (local.get $p0))
          (i32.const -16))))
    (local.get $l1))
  (func $emscripten_stack_init (export "emscripten_stack_init") (type $t2)
    (global.set $g2
      (i32.const 5244240))
    (global.set $g1
      (i32.and
        (i32.add
          (i32.const 1356)
          (i32.const 15))
        (i32.const -16))))
  (func $emscripten_stack_get_free (export "emscripten_stack_get_free") (type $t0) (result i32)
    (i32.sub
      (global.get $g0)
      (global.get $g1)))
  (func $emscripten_stack_get_base (export "emscripten_stack_get_base") (type $t0) (result i32)
    (global.get $g2))
  (func $emscripten_stack_get_end (export "emscripten_stack_get_end") (type $t0) (result i32)
    (global.get $g1))
  (func $__errno_location (export "__errno_location") (type $t0) (result i32)
    (i32.const 1352))
  (table $__indirect_function_table (export "__indirect_function_table") 1 1 funcref)
  (memory $memory (export "memory") 256 256)
  (global $g0 (mut i32) (i32.const 5244240))
  (global $g1 (mut i32) (i32.const 0))
  (global $g2 (mut i32) (i32.const 0))
  (data $d0 (i32.const 1024) "X\00\00\00T\00\00\00\06\00\00\00\05\00\00\00\00\00\00\00\0a\00\00\00M\00\00\00A\00\00\00\03\00\00\00S\00\00\00\00\00\00\00\00\00\00\00\07\00\00\00\0a\00\00\00[\00\00\00\0e\00\00\00\01\00\00\00H\00\00\00k\00\00\00\04\00\00\00\07\00\00\00f\00\00\00p\00\00\00c\00\00\00~\00\00\00L\00\00\00\00\00\00\00\00\00\00\00X\00\00\00T\00\00\00\06\00\00\00\05\00\00\00\00\00\00\00\0a\00\00\00M\00\00\00A\00\00\00\03\00\00\00S\00\00\00\00\00\00\00\00\00\00\00\07\00\00\00\0a\00\00\00[\00\00\00\0e\00\00\00\01\00\00\00H\00\00\00k\00\00\00\04\00\00\00\07\00\00\00f\00\00\00p\00\00\00c\00\00\00~\00\00\00L\00\00\00\00\00\00\00\00\00\00\00Y\00\00\00o\00\00\00u\00\00\00 \00\00\00d\00\00\00i\00\00\00d\00\00\00 \00\00\00n\00\00\00o\00\00\00t\00\00\00 \00\00\00o\00\00\00p\00\00\00e\00\00\00n\00\00\00 \00\00\00t\00\00\00h\00\00\00e\00\00\00 \00\00\00l\00\00\00o\00\00\00c\00\00\00k\00\00\00!\00\00\00"))

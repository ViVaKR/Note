# Note

## RID

>- RID (Runtime Identifier,런타임 식별자) : 애플리케이션을 실행하는 대상 플랫폼을 식별하는 데 사용됨
    - 패턴 : [os].[version]-[architecture]-[additional qualifiers]
    - architecture : x86, x64, arm, arm64
    - additional qualifiers : aot
        - Linux RID : linux-x64, linux-arm, linux-arm64, linux-bionic-arm64, linux-musl-x64, linux-musl-arm64
        - macOS RID : osx-x64 (macOS 10.12 Sierra), osx-arm64
        - iOS : ios-arm64
        - Android RID : android-arm64
        - Windows RID : win-x64, win-x86, win-arm64

export const Config = {
    regions: {
        main: { name: "Main", address: "suroi-main.gopubby.com", https: true },
        snipers: { name: "Snipers", address: "suroi-snipers.gopubby.com", https: true },
    },
    defaultRegion: "main",
    mode: "normal"
} satisfies ConfigType as ConfigType;

export interface ConfigType {
    readonly regions: Record<string, {
        readonly name: string
        readonly address: string
        readonly https: boolean
    }>
    readonly defaultRegion: string
    readonly mode: string
}

import { DocumentUri, TextEdit, CompletionList, CompletionItem, Hover, DocumentHighlight, Definition, Location, DocumentLink, SymbolInformation, ColorInformation, ColorPresentation, SignatureHelp, FoldingRange, CodeAction, TextDocumentEdit, Diagnostic } from 'vscode-languageserver-types';
import { CancellationToken, Connection, InitializeParams, DocumentFormattingParams, CompletionParams, TextDocumentPositionParams, DocumentLinkParams, DocumentSymbolParams, DocumentColorParams, ColorPresentationParams, FoldingRangeParams, CodeActionParams, RenameFilesParams, ExecuteCommandParams, ServerCapabilities } from 'vscode-languageserver';
import { TextDocument } from 'vscode-languageserver-textdocument';
import { CancellationToken as CancellationToken$1 } from 'typescript';

interface VCancellationToken extends CancellationToken {
    tsToken: CancellationToken$1;
}

declare class VLS {
    private lspConnection;
    private workspaces;
    private nodeModulesMap;
    private documentService;
    private globalSnippetDir;
    private loadingProjects;
    private projects;
    private pendingValidationRequests;
    private cancellationTokenValidationRequests;
    private validationDelayMs;
    private documentFormatterRegistration;
    private workspaceConfig;
    constructor(lspConnection: Connection);
    init(params: InitializeParams): Promise<{
        capabilities: {};
    } | undefined>;
    listen(): void;
    private getVLSFullConfig;
    private addWorkspace;
    private setupWorkspaceListeners;
    private setupConfigListeners;
    private getAllProjectConfigs;
    private warnProjectIfNeed;
    getProjectRootPath(uri: DocumentUri): string | undefined;
    private getProjectConfig;
    private getProjectService;
    private setupLSPHandlers;
    private setupCustomLSPHandlers;
    private setupDynamicFormatters;
    private setupFileChangeListeners;
    /**
     * Custom Notifications
     */
    openWebsite(url: string): void;
    /**
     * Language Features
     */
    onDocumentFormatting(params: DocumentFormattingParams): Promise<TextEdit[]>;
    onCompletion(params: CompletionParams): Promise<CompletionList>;
    onCompletionResolve(item: CompletionItem): Promise<CompletionItem>;
    onHover(params: TextDocumentPositionParams): Promise<Hover>;
    onDocumentHighlight(params: TextDocumentPositionParams): Promise<DocumentHighlight[]>;
    onDefinition(params: TextDocumentPositionParams): Promise<Definition>;
    onReferences(params: TextDocumentPositionParams): Promise<Location[]>;
    onDocumentLinks(params: DocumentLinkParams): Promise<DocumentLink[]>;
    onDocumentSymbol(params: DocumentSymbolParams): Promise<SymbolInformation[]>;
    onDocumentColors(params: DocumentColorParams): Promise<ColorInformation[]>;
    onColorPresentations(params: ColorPresentationParams): Promise<ColorPresentation[]>;
    onSignatureHelp(params: TextDocumentPositionParams): Promise<SignatureHelp | null>;
    onFoldingRanges(params: FoldingRangeParams): Promise<FoldingRange[]>;
    onCodeAction(params: CodeActionParams): Promise<never[] | CodeAction[]>;
    onCodeActionResolve(action: CodeAction): Promise<CodeAction>;
    onWillRenameFiles({ files }: RenameFilesParams): Promise<{
        documentChanges: TextDocumentEdit[];
    } | null>;
    private triggerValidation;
    cancelPastValidation(textDocument: TextDocument): void;
    cleanPendingValidation(textDocument: TextDocument): void;
    validateTextDocument(textDocument: TextDocument, cancellationToken?: VCancellationToken): Promise<void>;
    doValidate(doc: TextDocument, cancellationToken?: VCancellationToken): Promise<Diagnostic[] | null>;
    executeCommand(arg: ExecuteCommandParams): Promise<void>;
    removeDocument(doc: TextDocument): Promise<void>;
    dispose(): void;
    get capabilities(): ServerCapabilities;
}

interface BasicComponentInfo {
    name: string;
    path: string;
}
declare type Glob = string;
interface VeturProject<C = BasicComponentInfo | Glob> {
    root: string;
    package?: string;
    tsconfig?: string;
    snippetFolder: string;
    globalComponents: C[];
}
interface VeturFullConfig {
    settings: Record<string, boolean | string | number>;
    projects: VeturProject<BasicComponentInfo>[];
}
declare type VeturConfig = Partial<Pick<VeturFullConfig, 'settings'>> & {
    projects?: Array<string | (Pick<VeturProject, 'root'> & Partial<VeturProject>)>;
};

export { VLS, VeturConfig };
